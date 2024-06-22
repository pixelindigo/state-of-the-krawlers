package com.crawljax.examples.stateabstractions.python;

import com.crawljax.browser.EmbeddedBrowser;
import com.crawljax.core.state.StateVertex;
import com.crawljax.core.state.StateVertexFactory;

import com.crawljax.examples.stateabstractions.python.PythonStateVertexImpl;

import org.jpy.PyLib;
import org.jpy.PyModule;
import org.jpy.PyObject;

import java.util.LinkedList;
import java.util.List;
import java.util.Arrays;

public class PythonStateVertexFactory extends StateVertexFactory {

	private static PyModule ndalgorithms;
	private static String algorithm;
	private static List<Object> args;

	public PythonStateVertexFactory(String algorithm, Object... args) {
		if (!PyLib.isPythonRunning()) {
			PyLib.startPython();
		}
		PythonStateVertexFactory.ndalgorithms = PyModule.importModule("ndalgorithms");
		PythonStateVertexFactory.algorithm = algorithm;
		PythonStateVertexFactory.args = Arrays.asList(args);
	}

	@Override
	public StateVertex newStateVertex(int id, String url, String name, String dom,
			String strippedDom,
			EmbeddedBrowser browser) {
		LinkedList args = new LinkedList<Object>() {{
			add(null);
			add(url);
			add(dom);
			add(null);
			add(null);
		}};
		args.addAll(PythonStateVertexFactory.args);
		PyObject state = PythonStateVertexFactory.ndalgorithms.call(PythonStateVertexFactory.algorithm, args.toArray());
		return new PythonStateVertexImpl(id, url, name, dom, strippedDom, state);
	}

	@Override
	public String toString() {
		return PythonStateVertexFactory.algorithm;
	}

}
