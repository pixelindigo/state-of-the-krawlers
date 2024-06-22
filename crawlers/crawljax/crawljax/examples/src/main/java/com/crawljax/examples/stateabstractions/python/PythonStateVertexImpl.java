package com.crawljax.examples.stateabstractions.python;

import com.crawljax.core.state.StateVertex;
import com.crawljax.core.state.StateVertexImpl;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

import org.jpy.PyObject;

public class PythonStateVertexImpl extends StateVertexImpl {

	private static final long serialVersionUID = 123400017983489L;

	private PyObject pyState;

	/**
	 * Defines a State.
	 *
	 * @param id          id of the state in the SFG
	 * @param url         the current url of the state
	 * @param name        the name of the state
	 * @param dom         the current DOM tree of the browser
	 * @param strippedDom the stripped dom by the OracleComparators
	 * @param threshold   the threshold to be used
	 * @param algorithm   the algorithm to use
	 */
	public PythonStateVertexImpl(int id, String url, String name, String dom, String strippedDom, PyObject pyState) {
		super(id, url, name, dom, strippedDom);
		this.pyState = pyState;
	}

	@Override
	public int hashCode() {
		// FIXME casting could cause problems
		return (int) this.pyState.hash();
	}

	@Override
	public boolean equals(Object object) {
		PythonStateVertexImpl that = (PythonStateVertexImpl) object;
		return this.pyState.eq(that.getPyState());
	}

	public PyObject getPyState() {
		return this.pyState;
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", super.getId())
				.add("name", super.getName()).toString();
	}

	@Override
	public double getDist(StateVertex vertexOfGraph) {
		PythonStateVertexImpl that = (PythonStateVertexImpl) vertexOfGraph;
		return this.pyState.call("get_dist", that.getPyState()).getDoubleValue();
		//return -1;
	}
}
