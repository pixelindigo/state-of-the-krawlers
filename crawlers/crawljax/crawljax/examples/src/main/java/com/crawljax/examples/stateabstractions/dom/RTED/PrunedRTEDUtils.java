package com.crawljax.examples.stateabstractions.dom.RTED;

import com.crawljax.util.DomUtils;
import org.w3c.dom.Node;
import org.w3c.dom.traversal.DocumentTraversal;
import org.w3c.dom.traversal.NodeFilter;
import org.w3c.dom.traversal.TreeWalker;

import com.crawljax.examples.stateabstractions.dom.RTED.RTED_InfoTree_Opt;
import com.crawljax.examples.stateabstractions.dom.RTED.LblTree;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PrunedRTEDUtils {

	private static final Logger LOG = LoggerFactory.getLogger("foobar");
	//private static final Logger LOG = LoggerFactory.getLogger(PrunedRTEDUtils.class.getName());

	/**
	 * Get a scalar value for the DOM diversity using the Robust Tree Edit Distance
	 *
	 * @param dom1
	 * @param dom2
	 * @return
	 */
	public static double getRobustTreeEditDistance(String dom1, String dom2) {
		LblTree domTree1 = null, domTree2 = null;
		try {
			domTree1 = getDomTree(dom1);
			domTree2 = getDomTree(dom2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//LOG.info("Tree #1: {}", domTree1.getNonce());
		//LOG.info("Tree #2: {}", domTree2.getNonce());

		double DD = 0.0;
		RTED_InfoTree_Opt rted;
		double ted;

		rted = new RTED_InfoTree_Opt(1, 1, 1);

		// compute tree edit distance
		rted.init(domTree1, domTree2);

		int maxSize = Math.max(domTree1.getNodeCount(), domTree2.getNodeCount());

		rted.computeOptimalStrategy();
		ted = rted.nonNormalizedTreeDist();
		ted /= (double) maxSize;

		DD = ted;
		//LOG.info("Distance: {}", DD);
		return DD;
	}

	private static LblTree getDomTree(String dom1) throws IOException {

		org.w3c.dom.Document doc1 = DomUtils.asDocument(dom1);

		LblTree domTree = null;

		DocumentTraversal traversal = (DocumentTraversal) doc1;
		TreeWalker walker = traversal.createTreeWalker(doc1.getDocumentElement(),
				NodeFilter.SHOW_ELEMENT, null, true);
		domTree = createTree(walker);

		return domTree;
	}

	/**
	 * Recursively construct a LblTree from DOM tree
	 *
	 * @param walker tree walker for DOM tree traversal
	 * @return tree represented by DOM tree
	 */
	private static LblTree createTree(TreeWalker walker) {
		Node parent = walker.getCurrentNode();
		LblTree node = new LblTree(parent.getNodeName(), -1); // treeID = -1
		String prev = null;
		String children = "<" + parent.getNodeName();
		for (Node n = walker.firstChild(); n != null; n = walker.nextSibling()) {
			LblTree next = createTree(walker);
			if (!next.getNonce().equals(prev)) {
				children += " " + next.getNonce();
				node.add(next);
				prev = next.getNonce();
			}
		}
		walker.setCurrentNode(parent);
		node.setNonce(children + ">");
		return node;
	}
}
