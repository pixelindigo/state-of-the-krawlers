package com.crawljax.examples;

import org.openqa.selenium.devtools.v85.page.Page;
import org.openqa.selenium.devtools.v85.page.model.FrameResourceTree;
import org.openqa.selenium.devtools.v85.page.model.FrameResource;
import org.openqa.selenium.devtools.v85.page.model.FrameId;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.devtools.DevTools;
import org.openqa.selenium.devtools.DevToolsException;
import com.crawljax.core.plugin.HostInterface;
import com.crawljax.core.plugin.HostInterfaceImpl;
import com.crawljax.browser.EmbeddedBrowser;
import com.crawljax.core.configuration.CrawljaxConfiguration;
import com.crawljax.core.plugin.OnBrowserCreatedPlugin;
import com.crawljax.core.plugin.OnNewStatePlugin;
import com.crawljax.core.plugin.PreCrawlingPlugin;
import com.crawljax.core.plugin.PostCrawlingPlugin;
import com.crawljax.core.CrawlerContext;
import com.crawljax.core.state.StateVertex;
import com.crawljax.core.CrawlSession;
import com.crawljax.core.ExitNotifier.ExitStatus;
import com.google.common.base.Strings;
import com.google.common.base.Charsets;
import com.google.common.io.Files;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import java.util.Base64;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.List;
import java.math.BigInteger;
import java.io.File;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.io.UnsupportedEncodingException;
import java.io.FileNotFoundException;


import org.openqa.selenium.devtools.NetworkInterceptor;
import org.openqa.selenium.remote.http.Filter;
import org.openqa.selenium.remote.http.HttpRequest;
import org.openqa.selenium.remote.http.HttpResponse;
import org.apache.commons.io.IOUtils;

import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVFormat;


class CapturedRequestResponse {
	private static final Logger LOG = LoggerFactory.getLogger(CapturedRequestResponse.class);

    private String reqHeaders;
    private String respHeaders;
    private String uri;
    private String method;
    private String reqHash;
    private String respHash;
    private int status;

    public CapturedRequestResponse(HttpRequest req, HttpResponse resp) {
        method = req.getMethod().toString();
        uri = req.getUri();
        status = resp.getStatus();
        reqHeaders = "";
        for (String name : req.getHeaderNames()) {
        	for (String value : req.getHeaders(name)) {
        		reqHeaders += name + ":" + value + "\r\n";
        	}
        }
        respHeaders = "";
        for (String name : resp.getHeaderNames()) {
        	for (String value : resp.getHeaders(name)) {
        		respHeaders += name + ":" + value + "\r\n";
        	}
        }

        reqHash = getHash(req.getContent().get());
        respHash = getHash(resp.getContent().get());
    }

    public String getRequestHeaders() {
    	return reqHeaders;
    }

    public String getResponseHeaders() {
    	return respHeaders;
    }

    public String getUri() {
    	return uri;
    }

    public String getMethod() {
    	return method;
    }

    public String getRequestHash() {
    	return reqHash;
    }

    public String getResponseHash() {
    	return respHash;
    }

    public int getStatus() {
    	return status;
    }

    private String getHash(InputStream in) {
		byte[] buffer = new byte[512];
		MessageDigest digest;

		try {
            digest = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
        	LOG.error("error: {}", e);
        	return "";
        }

		int len;
		try {
			while ((len = in.read(buffer, 0, buffer.length)) != -1) {
				digest.update(buffer, 0, len);
			}
		} catch (java.io.IOException e) {
			LOG.error("hashing error: {}", e);
		}
		return String.format("%0128x", new BigInteger(1, digest.digest()));
	}

	public boolean equals(Object object) {
		if (!(object instanceof CapturedRequestResponse)) {
			return false;
		}
		CapturedRequestResponse that = (CapturedRequestResponse) object;
		return getStatus() == that.getStatus()
				&& getRequestHeaders().equals(that.getRequestHeaders())
				&& getResponseHeaders().equals(that.getResponseHeaders())
				&& getUri().equals(that.getUri())
				&& getMethod().equals(that.getMethod())
				&& getRequestHash().equals(that.getRequestHash())
				&& getResponseHash().equals(that.getResponseHash());
	}


	public int hashCode() {
		return reqHeaders.hashCode() + respHeaders.hashCode()
				+ uri.hashCode() + method.hashCode()
				+ reqHash.hashCode() + respHash.hashCode() + status;
	}

	public String toString() {
		return uri;
	}
}


public class CaptureResourcesPlugin implements PreCrawlingPlugin, OnNewStatePlugin,
	OnBrowserCreatedPlugin, PostCrawlingPlugin {

	private static final Logger LOG = LoggerFactory.getLogger(CaptureResourcesPlugin.class);

    private HostInterface hostInterface;
    private File dir;
    private MessageDigest digest;
    private Map<String, Set<String>> resources;
    private Set<CapturedRequestResponse> requests;
    private NetworkInterceptor interceptor;
	public CaptureResourcesPlugin() {
		resources = new HashMap<>();
		requests = new HashSet<>();
		try {
            digest = MessageDigest.getInstance("SHA-512");
        } catch (NoSuchAlgorithmException e) {
        	LOG.error("error: {}", e);
        }
	}

	private String getHash(byte[] data) {
		digest.reset();
		digest.update(data);
		return String.format("%0128x", new BigInteger(1, digest.digest()));
	}

	@Override
	public void onBrowserCreated(EmbeddedBrowser browser) {
		//browser.getWebDriver();
		LOG.warn("browser created");
		ChromeDriver driver = (ChromeDriver) browser.getWebDriver();
		//DevTools devtools = driver.getDevTools();
		//devtools.createSession();
		//devtools.send(Profiler.enable());
		//devtools.send(Profiler.startPreciseCoverage(Optional.empty(),Optional.empty()));
		driver.getDevTools().createSessionIfThereIsNotOne();
		LOG.warn("session is {}", driver.getDevTools().getCdpSession());
        driver.getDevTools().send(Page.enable());

         Filter filter = next -> {
           return req -> {
             HttpResponse resp = next.execute(req);
			 synchronized(requests) {
			 	 requests.add(new CapturedRequestResponse(req, resp));
			 }
             return resp;
           };
         };

        interceptor = new NetworkInterceptor(driver, filter);
	}

    @Override
    public void preCrawling(CrawljaxConfiguration config) throws RuntimeException {
        if (hostInterface == null) {
            hostInterface = new HostInterfaceImpl(config.getOutputDir(), null);
        }
        File outputFolder = hostInterface.getOutputDirectory();
        dir = new File(outputFolder, "mhtml");
        dir.mkdirs();
    }

    private void getResourcesRecursively(FrameResourceTree tree, DevTools devtools) {
    	FrameId frameId = tree.getFrame().getId();
    	for (FrameResource resource : tree.getResources()) {
    		if (resource.getFailed().orElse(false) || resource.getCanceled().orElse(false)) {
    			continue;
    		}

    		try {
	    		Page.GetResourceContentResponse resp = devtools.send(Page.getResourceContent(frameId, resource.getUrl()));
	    		byte[] data = null;
	    		if (resp.getBase64Encoded()) {
	    			data = Base64.getDecoder().decode(resp.getContent());
	    		} else {
		    		try {
						data = resp.getContent().getBytes("utf8");
					} catch (UnsupportedEncodingException e) {
						LOG.error("error: {}", e);
					}
				}
	    		String hash = getHash(data);
				synchronized(resources) {
					if (resources.containsKey(resource.getUrl())) {
						resources.get(resource.getUrl()).add(hash);
					} else {
						HashSet<String> set = new HashSet<>();
						set.add(hash);
						resources.put(resource.getUrl(), set);
					}
				}
			} catch (DevToolsException e) {
				LOG.error("getResourceContent failed for {}: {}", resource.getUrl(), e);
			}
    	}
    	if (tree.getChildFrames().isPresent()) {
        	for (FrameResourceTree child : tree.getChildFrames().get()) {
        		getResourcesRecursively(child, devtools);
        	}
    	}
    }

	@Override
	public void onNewState(CrawlerContext context, StateVertex newState) {
		ChromeDriver driver = (ChromeDriver) context.getBrowser().getWebDriver();
		driver.getDevTools().createSessionIfThereIsNotOne();
		driver.getDevTools().send(Page.enable());
        //String data = driver.getDevTools().send(Page.captureSnapshot(Optional.empty()));
		try {
        	FrameResourceTree tree = driver.getDevTools().send(Page.getResourceTree());
	        getResourcesRecursively(tree, driver.getDevTools());
    	} catch (DevToolsException e) {
    		LOG.error("can't get resource tree for {}, {}", driver.getDevTools().getCdpSession(), e);
    	}

        /** try {
            Files.write(Strings.nullToEmpty(data), new File(dir, newState.getName() + ".mhtml"), Charsets.UTF_8);
        } catch (IOException e) {
            LOG.warn("Could not save mhtml snapshot for {} due to {}", newState.getName(), e);
        } */
    }

    @Override
    public void postCrawling(CrawlSession session, ExitStatus exitStatus) {
    	try {
	    	PrintWriter out = new PrintWriter(new File(dir, "resources.txt"));
			synchronized(resources) {
				for (Map.Entry<String, Set<String>> url: resources.entrySet()) {
					for (String hash : url.getValue()) {
						out.printf("%s %s\n", url.getKey(), hash);
					}
				}
			}
			out.flush();
			out.close();
    	} catch (FileNotFoundException e) {
    		LOG.error("can't write resources.txt", e);
    	}

    	try (CSVPrinter printer = new CSVPrinter(new FileWriter(new File(dir, "network.csv")), CSVFormat.DEFAULT)) {
     		printer.printRecord("url", "method", "req_headers", "req_hash", "resp_headers", "resp_hash", "status");
			 synchronized(requests) {
			 	for (CapturedRequestResponse rr : requests) {
					printer.printRecord(rr.getUri(), rr.getMethod(),
						rr.getRequestHeaders(), rr.getRequestHash(),
						rr.getResponseHeaders(), rr.getResponseHash(),
						rr.getStatus());
			 	}
			 }
    	} catch (java.io.IOException e) {
		    LOG.error("saving requests error: {}", e);
		}
    }
}
