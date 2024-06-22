package com.crawljax.examples.stateabstractions.dom;

import com.crawljax.browser.EmbeddedBrowser;
import com.crawljax.core.state.StateVertex;
import com.crawljax.core.state.StateVertexFactory;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.openqa.selenium.*;
import java.util.ArrayList;
import java.util.List;

import com.crawljax.examples.stateabstractions.dom.JAEK.Clickable;
import com.crawljax.examples.stateabstractions.dom.JAEK.Link;
import com.crawljax.examples.stateabstractions.dom.JAEK.FormHelper;
import com.crawljax.examples.stateabstractions.dom.JAEK.LinkHelper;
import com.crawljax.examples.stateabstractions.dom.JAEK.HtmlForm;
import org.openqa.selenium.By;


/**
 * The default factory that creates State vertexes with a {@link Object#hashCode()} and
 * {@link Object#equals(Object)} function based on the Stripped dom.
 */
public class JAEKStateVertexFactory extends StateVertexFactory {

	private static double threshold = 0.0;
	private static double form_weight = 1.0;
	private	static double link_weight = 1.0;
	private	static double clickable_weight = 1.0;

	private static final Logger LOGGER =
		LoggerFactory.getLogger(JAEKStateVertexFactory.class);

	public JAEKStateVertexFactory() {
	}

	public JAEKStateVertexFactory(double threshold, double form_weight, double link_weight, double clickable_weight) {
		JAEKStateVertexFactory.threshold = threshold;
		JAEKStateVertexFactory.form_weight = form_weight;
		JAEKStateVertexFactory.link_weight = link_weight;
		JAEKStateVertexFactory.clickable_weight = clickable_weight;
	}


	@Override
	public StateVertex newStateVertex(int id, String url, String name, String dom,
			String strippedDom,
			EmbeddedBrowser browser) {
		String properties = (String) browser.executeJavaScript("return catch_properties();");
		String event_listeners = (String) browser.executeJavaScript("return JSON.stringify(added_events);");

		List<WebElement> anchor_tags = browser.getWebDriver().findElements(By.tagName("a"));
		
		List<Clickable> new_clickables = new ArrayList<>();
		List<Link> new_links = new ArrayList<>();
		LinkHelper.extractNewLinksFromLinks((JavascriptExecutor) browser.getWebDriver(), anchor_tags, url, new_clickables, new_links);

		List<WebElement> iframes = browser.getWebDriver().findElements(By.tagName("iframe"));
		iframes.addAll(browser.getWebDriver().findElements(By.tagName("frame")));

		new_links.addAll(LinkHelper.extractLinksFromIframe((JavascriptExecutor) browser.getWebDriver(), iframes));

		List<HtmlForm> forms = FormHelper.extractForms((JavascriptExecutor) browser.getWebDriver(), browser.getWebDriver());

		new_clickables.addAll(LinkHelper.propertyHelper((JavascriptExecutor) browser.getWebDriver(), browser.getWebDriver()));

		return new JAEKStateVertexImpl(id, url, name, dom, strippedDom, forms, new_clickables, new_links, threshold,
			form_weight, link_weight, clickable_weight);
	}

	@Override
	public String toString() {
		return "JAEK_" + threshold;
	}

}
