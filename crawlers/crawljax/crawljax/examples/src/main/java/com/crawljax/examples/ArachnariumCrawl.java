package com.crawljax.examples;

import java.io.IOException;
import java.io.File;
import java.util.concurrent.TimeUnit;

import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import com.crawljax.browser.EmbeddedBrowser.BrowserType;
import com.crawljax.core.CrawljaxRunner;
import com.crawljax.core.configuration.BrowserConfiguration;
import com.crawljax.core.configuration.CrawlRules.FormFillMode;
import com.crawljax.core.configuration.CrawljaxConfiguration;
import com.crawljax.core.configuration.CrawljaxConfiguration.CrawljaxConfigurationBuilder;
import com.crawljax.plugins.crawloverview.CrawlOverview;
import com.crawljax.core.state.StateFlowGraph;

import com.crawljax.stateabstractions.dom.DOMConfiguration.Mode;

import com.crawljax.stateabstractions.visual.imagehashes.BlockMeanImageHashStateVertexFactory;
import com.crawljax.stateabstractions.visual.imagehashes.PerceptualImageHashStateVertexFactory;
import com.crawljax.stateabstractions.visual.ColorHistogramStateVertexFactory;
import com.crawljax.stateabstractions.dom.RTEDStateVertexFactory;
import com.crawljax.examples.stateabstractions.python.PythonStateVertexFactory;
import com.crawljax.examples.stateabstractions.dom.JAEKStateVertexFactory;
import com.crawljax.examples.stateabstractions.dom.SimHashStateVertexFactory;
import com.crawljax.examples.stateabstractions.dom.TLSHStateVertexFactory;
import com.crawljax.examples.stateabstractions.visual.PDiffStateVertexFactory;
import com.crawljax.examples.stateabstractions.visual.SIFTStateVertexFactory;
import com.crawljax.examples.stateabstractions.visual.SSIMStateVertexFactory;

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;
import picocli.CommandLine.Parameters;
import java.util.concurrent.Callable;

import com.google.common.io.ByteStreams;

import com.crawljax.browser.EmbeddedBrowser;

import com.crawljax.core.plugin.OnBrowserCreatedPlugin;
import com.crawljax.core.plugin.OnNewStatePlugin;
import com.crawljax.core.plugin.PreCrawlingPlugin;
import com.crawljax.core.plugin.NavigationPlugin;
import com.crawljax.core.CrawlerContext;
import com.crawljax.core.state.StateVertex;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.devtools.DevTools;
import org.openqa.selenium.devtools.v85.page.Page;
import org.openqa.selenium.devtools.v85.profiler.Profiler;
import org.openqa.selenium.devtools.v85.profiler.model.ScriptCoverage;
import org.openqa.selenium.devtools.v85.profiler.model.FunctionCoverage;
import org.openqa.selenium.devtools.v85.profiler.model.CoverageRange;
import java.util.Optional;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Random;
import com.google.common.collect.TreeRangeSet;
import com.google.common.collect.Range;
import com.google.common.collect.BoundType;

import com.crawljax.core.configuration.InputSpecification;
import com.crawljax.core.configuration.Form;
import com.crawljax.core.state.Identification;
import com.crawljax.core.state.Identification.How;
import com.crawljax.forms.FormInput;
import com.crawljax.forms.FormInput.InputType;

import com.crawljax.core.configuration.CrawlRules.CrawlPriorityMode;

import org.json.JSONObject;

import okhttp3.OkHttpClient;
import okhttp3.RequestBody;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.MediaType;

import java.util.concurrent.BlockingQueue;


import org.openqa.selenium.remote.HttpCommandExecutor;


import io.github.bonigarcia.wdm.WebDriverManager;


@Command(name = "crawljax", mixinStandardHelpOptions = true, version = "1.0",
         description = "crawls the web application")
class ArachnariumCrawl implements Callable<Integer> {

	private static final long WAIT_TIME_AFTER_EVENT = 500;
	private static final long WAIT_TIME_AFTER_RELOAD = 500;

	private static final Logger LOG = LoggerFactory.getLogger(ArachnariumCrawl.class);

	@Option(names = {"-a", "--algorithm"}, description = "apted, colorhist, ...")
    private String algorithm = "colorhist";
    @Option(names = {"-n", "--nav"}, description = "bfs, dfs, ...")
    private String navigation = "bfs";
    @Option(names = {"-u", "--url"}, description = "URL to crawl")
    private String url = "";
    @Option(names = {"-t", "--timeout"}, description = "timeout in minutes")
    private long timeout = -1;
    @Option(names = {"-c", "--threshold"}, description = "threshold")
    private double threshold = 1.0;
    @Option(names = {"--app"}, description = "apply app specific fixes")
    private String app = "";
    @Option(names = {"--setup"}, description = "setup chrome driver")
    private boolean setup = false;
    @Option(names = {"--resources"}, description = "capture resources")
    private boolean captureResources = false;
    @Option(names = {"--save-screenshots"}, description = "save state screenshots", negatable = true,
  		defaultValue = "true", fallbackValue = "true")
    private boolean saveScreenshots;
    @Option(names = {"--report-skeleton"}, description = "copy report skeleton", negatable = true,
  		defaultValue = "true", fallbackValue = "true")
    private boolean copySkeleton;

	/**
	 * Run this method to start the crawl.
	 * 
	 * @throws IOException
	 *             when the output folder cannot be created or emptied.
	 */
	 @Override
    public Integer call() throws Exception {

    	if (setup) {
    		WebDriverManager.chromedriver().setup();
    		return 0;
    	}

		CrawljaxConfigurationBuilder builder = CrawljaxConfiguration.builderFor(url);
		
		builder.crawlRules().setFormFillMode(FormFillMode.RANDOM);	
        //builder.setStateVertexFactory(new DHashStateVertexFactory());

		builder.setUnlimitedCrawlDepth();
		builder.crawlRules().clickElementsInRandomOrder(false);
        switch (navigation.toLowerCase()) {
        	case "cov":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.NORMAL);
        		//builder.addPlugin(new CoveragePlugin(1.0, 1.0, 1.0));
        		builder.addPlugin(new CoveragePlugin(1.0, 0.0, 0.0));
        		break;        	
        	case "feedex":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.NORMAL);
        		builder.addPlugin(new CoveragePlugin(1.0, 0.5, 0.3));
        		break;
        	case "dfs":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.NORMAL);
        		break;
        	case "jaw":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.OLDEST_FIRST);
        		// Constant in JAW, see:
        		// https://github.com/SoheilKhodayari/JAW/blob/e38e2e2bb733380bca997ee551b41af28038a81c/crawler/hpg_crawler/config.py#L33
        		builder.setMaximumDepth(15);
        		break;
        	case "random_local":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.OLDEST_FIRST);
				builder.crawlRules().clickElementsInRandomOrder(true);
        		break;
        	case "random_state":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.OLDEST_FIRST);
				builder.addPlugin(new RandomStatePlugin());
        		break;
        	case "random_global":
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.RANDOM_GLOBAL);
				builder.addPlugin(new RandomStatePlugin());
        		break;
        	case "bfs":
        	default:
        		builder.crawlRules().setCrawlPriorityMode(CrawlPriorityMode.OLDEST_FIRST);
        }
        switch (algorithm.toLowerCase()) {
            case "rted":
                builder.setStateVertexFactory(new RTEDStateVertexFactory(threshold));
                break;
            case "simhash":
                builder.setStateVertexFactory(new SimHashStateVertexFactory(threshold, Mode.STRIPPED_DOM));
                break;
            case "tlsh":
                builder.setStateVertexFactory(new TLSHStateVertexFactory(threshold, Mode.ORIGINAL_DOM));
                break;
            case "jaek":
                builder.addPlugin(new JaekPlugin());
                builder.setStateVertexFactory(new JAEKStateVertexFactory(threshold, 1.0, 1.0, 1.0));
                break;
            case "colorhist":
                builder.setStateVertexFactory(new ColorHistogramStateVertexFactory());
                break;
            case "phash":
                builder.setStateVertexFactory(new PerceptualImageHashStateVertexFactory());
                break;
            case "blockmeanhash":
                builder.setStateVertexFactory(new BlockMeanImageHashStateVertexFactory());
                break;
            case "pdiff":
                builder.setStateVertexFactory(new PDiffStateVertexFactory(threshold));
                break;
            case "sift":
                builder.setStateVertexFactory(new SIFTStateVertexFactory(threshold));
                break;
            case "ssim":
                builder.setStateVertexFactory(new SSIMStateVertexFactory(threshold));
                break;
            case "apted":
                builder.setStateVertexFactory(new PythonStateVertexFactory("APTEDState", threshold, false));
                break;
            case "apted_pruned":
                builder.setStateVertexFactory(new PythonStateVertexFactory("APTEDState", threshold, true));
                break;
            case "general_paths":
                builder.setStateVertexFactory(new PythonStateVertexFactory("GeneralPathsState"));
                break;
            case "widgets":
                builder.setStateVertexFactory(new PythonStateVertexFactory("WidgetsState"));
                break;
            case "domstreq":
                builder.setStateVertexFactory(new PythonStateVertexFactory("DOMStrEqState"));
                break;
            case "procrawl":
                builder.setStateVertexFactory(new PythonStateVertexFactory("ProcrawlState"));
                break;
            case "url_path":
                builder.setStateVertexFactory(new PythonStateVertexFactory("UrlState", false, false));
                break;
            case "url_query":
                builder.setStateVertexFactory(new PythonStateVertexFactory("UrlState", false, true));
                break;
            case "url_full":
                builder.setStateVertexFactory(new PythonStateVertexFactory("UrlState", true, false));
                break;
            default:
                throw new Exception("algorithm is not implemented");
        }

		// click these elements
		builder.crawlRules().clickDefaultElements();
		 /*builder.crawlRules().click("A");
		 builder.crawlRules().click("button");*/
		builder.crawlRules().crawlHiddenAnchors(true);
		builder.crawlRules().crawlFrames(false);
		builder.crawlRules().clickOnce(false);
		builder.setUnlimitedStates();
		if (timeout == -1) {
			builder.setUnlimitedRuntime();
		} else {
			builder.setMaximumRunTime(timeout, TimeUnit.MINUTES);
		}

		// Set timeouts
		builder.crawlRules().waitAfterReloadUrl(WAIT_TIME_AFTER_RELOAD, TimeUnit.MILLISECONDS);
		builder.crawlRules().waitAfterEvent(WAIT_TIME_AFTER_EVENT, TimeUnit.MILLISECONDS);

		builder.setBrowserConfig(new BrowserConfiguration(BrowserType.CHROME, 1));

		builder.crawlRules().setInputSpec(getInputSpecification());

		// CrawlOverview
		LOG.warn("screenshot saving is {}", saveScreenshots);
        builder.addPlugin(new CrawlOverview(saveScreenshots, copySkeleton));
        if (captureResources) {
			builder.addPlugin(new CaptureResourcesPlugin());
        }

		//builder.addPlugin(new CoveragePlugin());

		CrawljaxRunner crawljax = new CrawljaxRunner(builder.build());
		crawljax.call();
		return 0;
	}

	private class JaekPlugin implements OnBrowserCreatedPlugin {
		@Override
		public void onBrowserCreated(EmbeddedBrowser browser) {
			//browser.getWebDriver();
			LOG.warn("browser created");
			ChromeDriver driver = (ChromeDriver) browser.getWebDriver();
			//driver.getDevTools().createSessionIfThereIsNotOne();

			LOG.warn("session is {} and {}", driver.getDevTools().getCdpSession(), driver.getSessionId());
			try {
				addScript(driver, "js/lib.js");
				addScript(driver, "js/property_obs.js");
				addScript(driver, "js/md5.js");
				addScript(driver, "js/addeventlistener_wrapper.js");
				addScript(driver, "js/timing_wrapper.js");
				addScript(driver, "js/window_wrapper.js");
				// Black Widow additions
				addScript(driver, "js/forms.js");
				addScript(driver, "js/xss_xhr.js");
				addScript(driver, "js/remove_alerts.js");
				//LOG.info("Loaded JAEK and BlackWidow script files");
			} catch (IOException ex){
				LOG.error("can't read the js file: {}", ex);
			}
		}

		// TODO: doesn't work :C maybe sesion is different
		private void addScript(DevTools devtools, String fileName) throws IOException {
			String src = new String(ByteStreams.toByteArray(getClass().getClassLoader().getResourceAsStream(fileName)));
			LOG.warn("addScript res: {}", devtools.send(Page.addScriptToEvaluateOnNewDocument(src, Optional.empty())));
		}

		private void addScript(ChromeDriver driver, String fileName) throws IOException {
		//Map<String, String> arguments = new HashMap<String, String>();
		//arguments.put("source", new String(ByteStreams.toByteArray(getClass().getClassLoader().getResourceAsStream(fileName))));
		String jsonString = new JSONObject()
                  .put("cmd", "Page.addScriptToEvaluateOnNewDocument")
                  .put("params",
                  	new JSONObject()
                  	.put("source", new String(ByteStreams.toByteArray(getClass().getClassLoader().getResourceAsStream(fileName)))))
                  .toString();

        String url = ((HttpCommandExecutor)driver.getCommandExecutor()).getAddressOfRemoteServer() + "/session/" + driver.getSessionId() + "/chromium/send_command_and_get_result";
        LOG.info("Sending js to {}", url);
		OkHttpClient client = new OkHttpClient();
		RequestBody body = RequestBody.create(MediaType.get("application/json; charset=utf-8"), jsonString);
		Request request = new Request.Builder()
		      .url(url)
		      .post(body)
		      .build();
		  try (Response response = client.newCall(request).execute()) {
		    //return response.body().string();
		    LOG.info("Got code:{} with body:{}", response.code(), response.body().string());
		  }
		//driver.executeCdpCommand("Page.addScriptToEvaluateOnNewDocument", arguments);
		}
	}

	private class RandomStatePlugin implements NavigationPlugin {

		private final Random random;

		public RandomStatePlugin() {
			random = new Random();
		}

		@Override
		public StateVertex selectState(StateFlowGraph sfg, CrawlPriorityMode crawlPriorityMode,
			BlockingQueue<Integer> statesWithCandidates) {
				while (true) {
					int idx = this.random.nextInt(statesWithCandidates.size());
					for (int id : statesWithCandidates) {
						if (idx == 0) {
							return sfg.getById(id);
						}
						idx--;
					}
					try {
						// Hack: blocks until it becomes non-empty
						statesWithCandidates.add(statesWithCandidates.take());
					} catch (InterruptedException ex) {
		    			LOG.info("Got interrupted while waiting for a new state: {}", ex);
						continue;
					}
				}
			}
	}

	private class CoveragePlugin implements OnNewStatePlugin, OnBrowserCreatedPlugin, NavigationPlugin {

		private HashMap<String, TreeRangeSet<Integer>> coverage;
		private HashMap<String, Long> scriptCoverage;
		private HashMap<String,Double> statesDistanceDiversity = new HashMap<String,Double>();
		private HashMap<Integer,Double> statesCoverageIncrease = new HashMap<Integer,Double>();
		private double Cov_weight, PD_weight, DD_weight;

		public CoveragePlugin(double Cov_weight, double PD_weight, double DD_weight) {
			this.coverage = new HashMap<>();
			this.scriptCoverage = new HashMap<>();

			this.Cov_weight = Cov_weight;
			this.PD_weight = PD_weight;
			this.DD_weight = DD_weight;
		}

		@Override
		public void onNewState(CrawlerContext context, StateVertex newState) {
			ChromeDriver driver = (ChromeDriver) context.getBrowser().getWebDriver();
			//DevTools devtools = driver.getDevTools();
			//devtools.createSession();
			long delta = 0;
			for (ScriptCoverage cov : driver.getDevTools().send(Profiler.takePreciseCoverage()).getResult()) {
				//LOG.warn("cov: {} {}", cov.getUrl(), cov.getScriptId());
				TreeRangeSet<Integer> coverageSet = coverage.computeIfAbsent(cov.getScriptId().toString(), k -> TreeRangeSet.create());
				for (FunctionCoverage fcov : cov.getFunctions()) {
					//LOG.warn("fcov: {} {}", fcov.getFunctionName(), fcov.getIsBlockCoverage());
					for (CoverageRange range : fcov.getRanges()) {
						//LOG.warn("range: {} {} {}", range.getStartOffset(), range.getEndOffset(), range.getCount());
						if (range.getCount() > 0) {
							coverageSet.add(Range.closedOpen(range.getStartOffset(), range.getEndOffset()));
						}
					}
				}
				long script_loc = 0;
				for (Range<Integer> range : coverageSet.asRanges()) {
					int upper = range.upperBoundType() == BoundType.OPEN ? range.upperEndpoint() : range.upperEndpoint() + 1;
					int lower = range.lowerBoundType() == BoundType.OPEN ? range.lowerEndpoint() + 1 : range.lowerEndpoint();
					script_loc += upper - lower;
				}
				delta += script_loc - scriptCoverage.getOrDefault(cov.getScriptId().toString(), 0L);
				scriptCoverage.put(cov.getScriptId().toString(), script_loc);
			}

			statesCoverageIncrease.put(newState.getId(), (double)delta);
			updatePairwiseDistances(context.getSession().getStateFlowGraph(), newState);
		}

		@Override
		public StateVertex selectState(StateFlowGraph sfg, CrawlPriorityMode crawlPriorityMode,
			BlockingQueue<Integer> statesWithCandidates) {
			int index = 0;

			LinkedList<Double> minPathDiv = new LinkedList<Double>();
			LinkedList<Double> minDOMDiv = new LinkedList<Double>();
			double minPD=1.0, PD, AvgMinPD=0.0;
			double minDD, AvgMinDD=0.0;

			// calculating minimum pair-wise Path-diversity and pair-wise DOM-diversity
			// Amin: TODO may need to check path-diversity w.r.t all states in the SFG
			for (int id : statesWithCandidates) {
				minDD = getMinDOMDiversity(sfg, sfg.getById(id));
				//LOGGER.info("MinDD of state " +  notFullExpandedStates.get(i).getName() + " is " + minDD);

				for (int other_id : statesWithCandidates){
					if (id != other_id){
						PD = sfg.getPathDiversity(sfg.getById(id), sfg.getById(other_id));
						//LOGGER.info("PD of state " +  notFullExpandedStates.get(i).getName()
						//		+ " and state " +  notFullExpandedStates.get(j).getName() + " is " + PD);
						if (PD < minPD)
							minPD = PD;
					}
				}

				//LOGGER.info("minPD of state " +  notFullExpandedStates.get(i).getName() + " is " + minPD);
				minPathDiv.add(minPD);
				AvgMinPD += minPD;
				minPD=1.0;
				//LOGGER.info("minDD of state " +  notFullExpandedStates.get(i).getName() + " is " + minDD);
				minDOMDiv.add(minDD);
				AvgMinDD += minDD;
				minDD=1.0;
			}
			AvgMinPD /= statesWithCandidates.size();
			//LOGGER.info("AvgMinPD is " +  AvgMinPD);
			AvgMinDD /= statesWithCandidates.size();
			//LOGGER.info("AvgMinDD is " +  AvgMinDD);

			double winnerScore = 0.0;
			double stateScore = 0.0;
			double coverageIncrease = 0.0;
			double winnerCoverageIncrease = 0.0;

			for (int id : statesWithCandidates) {
				coverageIncrease = statesCoverageIncrease.get(id);

				stateScore = Cov_weight*coverageIncrease + PD_weight*minPathDiv.poll() + DD_weight*minDOMDiv.poll();

				if (stateScore >= winnerScore){
					winnerScore = stateScore;
					winnerCoverageIncrease = coverageIncrease;
					index = id;
				}
			}

			//LOGGER.info("The winner state is " +  notFullExpandedStates.get(index).getName()
			//		+ " with score "  + (Cov_weight*winnerCoverageIncrease + PD_weight*minPathDiv.get(index) + DD_weight*minDOMDiv.get(index)));
			LOG.warn("Plugin selected state: {}", index);
			return sfg.getById(index);
		}

		private double getMinDOMDiversity(StateFlowGraph sfg, StateVertex state) {
			double DD = 0.0, minDD = 1.0;
			for (StateVertex s: sfg.getAllStates()){
				if (state.getId() != s.getId() && statesDistanceDiversity.containsKey(state.getName() + "," + s.getName())){
					DD = statesDistanceDiversity.get(state.getName() + "," + s.getName());
					//LOGGER.info("DD of state " + s + " and " + stateVertix + " is " + DD);
					if (DD < minDD) minDD = DD;
				}
			}
			return minDD;
		}

		private void updatePairwiseDistances(StateFlowGraph sfg, StateVertex newState) {
			double DD;
			synchronized(statesDistanceDiversity){
				for (StateVertex s: sfg.getAllStates()){
					if (s.getId() == newState.getId()) {
						continue;
					}
					DD = s.getDist(newState);
					//LOGGER.info("DD of states " + s + " and " + stateVertix + " is " + DD);
					statesDistanceDiversity.put(s.getName() + "," + newState.getName(), DD);
					statesDistanceDiversity.put(newState.getName() + "," + s.getName(), DD);
				}
			}
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
			driver.getDevTools().send(Profiler.enable());
			driver.getDevTools().send(Profiler.startPreciseCoverage(Optional.empty(),Optional.of(true),Optional.empty()));
		}
	}

	private InputSpecification getInputSpecification() {
		InputSpecification inputSpec = new InputSpecification();
		Form loginForm = new Form();
		switch(app) {
			case "addressbook":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "user")).inputValues("admin");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "pass")).inputValues("admin");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "Login");
				break;
			case "prestashop":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "email")).inputValues("jaekpot@localhost.com");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "passwd")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("button");
				break;
			case "drupal":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "name")).inputValues("jAEkPot");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "pass")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input");
				break;
			case "phpbb2":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "username")).inputValues("jAEkPot");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "Log in");
				break;
			case "wordpress":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "log")).inputValues("jAEkPot");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "pwd")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input");
				break;
			case "joomla":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "username")).inputValues("jAEkPot");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("button");
				break;
			case "oscommerce2":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "email_address")).inputValues("jaekpot@localhost.com");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("button").withAttribute("id", "tdb1");
				break;
			case "owncloud":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "user")).inputValues("jAEkPot");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("button");
				break;
			case "scarf":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "email")).inputValues("jaekpot@localhost.com");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "Login");
				break;
			case "vanilla":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "User/Email")).inputValues("jaekpot@localhost.com");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "User/Password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "Sign In");
				break;
			case "hotcrp":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "email")).inputValues("jaekpot@localhost.com");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("jAEkPot");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "Sign in");
				break;
			case "wackopicko":
				loginForm.inputField(InputType.TEXT, new Identification(How.name, "adminname")).inputValues("admin");
				loginForm.inputField(InputType.PASSWORD, new Identification(How.name, "password")).inputValues("admin");
				inputSpec.setValuesInForm(loginForm).beforeClickElement("input").withAttribute("value", "submit");
				break;
			default:
				break;
		}
		return inputSpec;
	}

	public static void main(String... args) {
        int exitCode = new CommandLine(new ArachnariumCrawl()).execute(args);
        System.exit(exitCode);
    }

}
