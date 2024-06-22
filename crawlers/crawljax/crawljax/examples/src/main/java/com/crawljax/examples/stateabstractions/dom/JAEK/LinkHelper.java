package com.crawljax.examples.stateabstractions.dom.JAEK;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;

import org.openqa.selenium.*;
import com.crawljax.examples.stateabstractions.dom.JAEK.Clickable;
import com.crawljax.examples.stateabstractions.dom.JAEK.Link;

import org.openqa.selenium.By;

public class LinkHelper {
	public static void extractNewLinksFromLinks(JavascriptExecutor driver, List<WebElement> elements, String requested_url,
											List<Clickable> new_clickables, List<Link> found_links) {
		// String xpath = (WebElement) ((JavascriptExecutor) driver).executeScript( "return getXPath(arguments[0]);", c);
		//List<Clickable> new_clickables = new ArrayList<>();
		//List<Link> found_links = new ArrayList<>();
	    for (WebElement element : elements) {
	        String href = element.getAttribute("href");
	        //logging.debug(str(type(elem)) + " href: " + str(href) + " Tagname: " + str(elem.tagName()))
	        if (href == null || href.equals("/") || href.equals(requested_url) || href.isEmpty()) { //or href[0] == '#':
	            continue;
	            // It's better to use startsWith, but JAEK used contains, so I left it as is
	            // also I added null check because it seems that there are some anchors without href??
	        } else if (href.contains("javascript:")) { //We assume it as clickable;
	            String html_id = element.getAttribute("id");
	            String html_class = element.getAttribute("class");
	            String dom_address = (String) (driver.executeScript( "return getXPath(arguments[0]);", element));
	            new_clickables.add(new Clickable(href, "a", dom_address, html_id, html_class));
	        } else if (href.contains("#")) {
	            String html_id = element.getAttribute("id");
	            String html_class = element.getAttribute("class");
	            String dom_address = (String) (driver.executeScript( "return getXPath(arguments[0]);", element));
	            new_clickables.add(new Clickable("click", "a", dom_address, html_id, html_class));
	        } else if (href.length() > 0) {
	            String html_id = element.getAttribute("id");
	            String html_class = element.getAttribute("class");
	            String dom_address = (String) (driver.executeScript( "return getXPath(arguments[0]);", element));
	            found_links.add(new Link(href, dom_address, html_id, html_class));
	        } else {
	            //LOGGER.info("Elem has attribute href: {} and matches no criteria", href);
	        }
	    }
    	//return found_links, new_clickables
    }
    public static List<Link> extractLinksFromIframe(JavascriptExecutor driver, List<WebElement> elements) {
		List<Link> found_links = new ArrayList<>();
	    for (WebElement element : elements) {
	        String src = element.getAttribute("src");
            String html_id = element.getAttribute("id");
            String html_class = element.getAttribute("class");
	        String dom_address = (String) (driver.executeScript( "return getXPath(arguments[0]);", element));
	        found_links.add(new Link(src, dom_address, html_id, html_class));
	    }
	    return found_links;
	}

	private static final List<String> PROPERTIES = new ArrayList<>(Arrays.asList(
    	"onclick", "onmouseover", "onabort", "onblur", "onchange", "onblclick", "onerror", "onfocus", "onkeydown",
	                  "onkeypress", "onkeyup", "onmousedown", "onmousemove", "onmouseout", "onmouseup"));

	public static List<Clickable> propertyHelper(JavascriptExecutor driver, SearchContext frame) {
	    List<Clickable> result = new ArrayList<>();
	    //TODO: not sure about By.ByCssSelector("*")
	    // https://doc.qt.io/archives/qt-4.8/qwebframe.html#findAllElements
	    for (WebElement element : frame.findElements(By.cssSelector("*"))) {
	    	try {
		        String element_id = element.getAttribute("id");
		        String element_class = element.getAttribute("class");
		        String element_dom_address = null;
		        for (String prop : PROPERTIES) {
		            if (element.getAttribute(prop) != null){
		                if (element_dom_address == null){
		                    element_dom_address = (String) (driver.executeScript("return getXPath(arguments[0]);", element));
		                }
		                result.add(new Clickable(prop, element.getTagName(), element_dom_address, element_id, element_class, "None"));
		            }
		        }
		    } catch(StaleElementReferenceException ex) {
		    	//LOGGER.info("Got stale web element reference exception, skipping");
		    	continue;
		    }
	    }
	    return result;
	}
}
