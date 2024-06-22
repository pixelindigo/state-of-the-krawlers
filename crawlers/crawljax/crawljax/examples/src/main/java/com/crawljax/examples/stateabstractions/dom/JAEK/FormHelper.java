package com.crawljax.examples.stateabstractions.dom.JAEK;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.openqa.selenium.*;
import com.crawljax.examples.stateabstractions.dom.JAEK.FormInput;
import com.crawljax.examples.stateabstractions.dom.JAEK.HtmlForm;

public class FormHelper {
	public static List<HtmlForm> extractForms(JavascriptExecutor driver, SearchContext frame) {
	    List<HtmlForm> result = new ArrayList<>();
	    for (WebElement form : frame.findElements(By.tagName("form"))) {
	        String action = form.getAttribute("action");
	        // method = form.attribute("method") if form.attribute("method") == "post" else "get"
	        String method = form.getAttribute("method");
	        if (method != "post") {
	        	method = "get";
	        }
	        String dom_address = (String) (driver.executeScript("return getXPath(arguments[0]);", form));
	        List<FormInput> form_params = extractingInformation(form);
	        result.add(new HtmlForm(form_params, action, method, dom_address));
	    }
	    return result;
	}

	private static List<FormInput> extractingInformation(WebElement elem) {
		List<FormInput> result = new ArrayList<>();
	    Map<String, List<String>> radio_buttons = new HashMap<>();
	    for (WebElement input_el : elem.findElements(By.tagName("input"))) {
	        String tag_name = input_el.getTagName();
	        String input_type = input_el.getAttribute("type");
	        if (input_type != null) {
	            if (!input_type.equals("radio")) {  // no radio button
	            	String name = input_el.getAttribute("name");
	                if (name != null || input_type.equals("submit")) {
	                } else {
	                    continue; //A input-element without name has no impact, why waste memory? Ok jaek you are alright, if it is a submit element we need it...
	                }
	                List<String> values = new ArrayList<>();
	                values.add(input_el.getAttribute("value"));
	                result.add(new FormInput(tag_name, name, input_type, values));
	            } else {  // input is radiobutton
	                String name = input_el.getAttribute("name");
	                if (!radio_buttons.containsKey(name)) {
	                	radio_buttons.put(name, new ArrayList<>());
	                }
	                radio_buttons.get(name).add(input_el.getAttribute("value"));
	            }
	        } else {
	        	String name = input_el.getAttribute("name");
	            if (name != null) {
	            	result.add(new FormInput(tag_name, name, null, null));
	            }
	        }
	    }
	    for (Map.Entry<String, List<String>> entry : radio_buttons.entrySet()) {
	    	// In the original code it uses tag_name and input_type from the last element
	    	// So I decided to fix it
	    	// for key in radio_buttons:
            //     result.append(FormInput(tag_name, key, input_type, radio_buttons[key]))
	    	result.add(new FormInput("input", entry.getKey(), "radio", entry.getValue()));
	    }
	    for (WebElement button : elem.findElements(By.tagName("button"))) {
	        String tag_name = button.getTagName();
	        String button_type = button.getAttribute("type");
	        String name = button.getAttribute("name");
			List<String> values = new ArrayList<>();
            values.add(button.getAttribute("value"));
            result.add(new FormInput(tag_name, name, button_type, values));
	    }
	    for (WebElement select : elem.findElements(By.tagName("select"))) {  // <select> <option>
	    	String select_name = select.getAttribute("name");
	    	List<String> values = new ArrayList<>();
	    	for (WebElement option : select.findElements(By.tagName("option"))) {
	            values.add(option.getAttribute("value"));
	        }
	        result.add(new FormInput(select.getTagName(), select_name, null, values));
	    }
	    return result;
	}
}
