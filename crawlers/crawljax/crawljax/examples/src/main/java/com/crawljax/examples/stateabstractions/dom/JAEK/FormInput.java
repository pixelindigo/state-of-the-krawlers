package com.crawljax.examples.stateabstractions.dom.JAEK;

import java.util.List;

public class FormInput {

	public String tag;
	public String name;
	public String input_type;
	public List<String> values;


	public FormInput(String tag, String name, String input_type, List<String> values) {
		this.tag = tag;
		this.name = name;
		this.input_type = input_type;
		this.values = values;
	}
}
