package com.crawljax.plugins.testcasegenerator.report;

public class TestStateDiff {
	private String state;
	private String oldState;
	private String newState;

	public String getOldState() {
		return oldState;
	}

	public void setOldState(String oldState) {
		this.oldState = oldState;
	}

	public String getNewState() {
		return newState;
	}

	public void setNewState(String newState) {
		this.newState = newState;
	}

	public String getState() {
		return state;
	}

	public void setState(String vertexName) {
		this.state = vertexName;
	}

}
