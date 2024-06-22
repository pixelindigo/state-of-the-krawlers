package com.crawljax.examples.stateabstractions.dom;

import com.crawljax.core.state.StateVertex;
import com.crawljax.core.state.StateVertexImpl;
import com.crawljax.stateabstractions.dom.RTED.RTEDUtils;
import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

import java.util.List;
import com.crawljax.examples.stateabstractions.dom.JAEK.Clickable;
import com.crawljax.examples.stateabstractions.dom.JAEK.Link;
import com.crawljax.examples.stateabstractions.dom.JAEK.HtmlForm;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The state vertex class which represents a state in the browser. When iterating over the possible
 * candidate elements every time a candidate is returned its removed from the list so it is a one
 * time only access to the candidates.
 */
public class JAEKStateVertexImpl extends StateVertexImpl {

	private static final long serialVersionUID = 123400017983489L;

	private static final Logger LOGGER =
	LoggerFactory.getLogger(JAEKStateVertexImpl.class);

	private double threshold;
	private double form_weight = 1.0;
	private	double link_weight = 1.0;
	private	double clickable_weight = 1.0;

	public List<HtmlForm> forms;
	public List<Clickable> clickables;
	public List<Link> links;

	/**
	 * Defines a State.
	 *
	 * @param id          id of the state in the SFG
	 * @param url         the current url of the state
	 * @param name        the name of the state
	 * @param dom         the current DOM tree of the browser
	 * @param strippedDom the stripped dom by the OracleComparators
	 * @param threshold   the threshold to be used
	 */
	public JAEKStateVertexImpl(int id, String url, String name, String dom, String strippedDom,
			List<HtmlForm> forms, List<Clickable> clickables, List<Link> links, double threshold,
			double form_weight, double link_weight, double clickable_weight) {
		super(id, url, name, dom, strippedDom);
		this.forms = forms;
		this.clickables = clickables;
		this.links = links;
		this.threshold = threshold;
		this.form_weight = form_weight;
		this.link_weight = link_weight;
		this.clickable_weight = clickable_weight;
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(this.getStrippedDom());
	}

	public double computeDistance(JAEKStateVertexImpl other) {
		double form_weight = this.form_weight;
		double link_weight = this.link_weight;
		double clickable_weight = this.clickable_weight;
		if (this.getDom().equals(other.getDom())) {
			return 0.0;
		}
	    double form_similarity = 0.0;
	    double identical_forms = 0.0;
	    int form_counter = this.forms.size() + other.forms.size();
	    if (form_counter > 0) {
	        for (HtmlForm p1_form : this.forms) {
	            boolean is_in_other = false;
	            for (HtmlForm p2_form : other.forms) {
	                if (p1_form.equals(p2_form)) {
	                    is_in_other = true;
	                    break;
	                }
	            }
	            if (is_in_other) {
	                identical_forms += 1.0;
	                form_counter--;
	            }
	        }
	        form_similarity = identical_forms / form_counter;
	    } else {
	        form_weight = 0.0;
	    }

	    double link_similarity = 0.0;
	    double identical_links = 0.0;
	    int link_counter = this.links.size() + other.links.size();
	    if (link_counter > 0) {
	        for (Link p1_link : this.links) {
	            boolean is_in_other = false;
	            for (Link p2_link : other.links) {
	            	// if p1_link.url.abstract_url == p2_link.url.abstract_url:
	                if (p1_link.url.equals(p2_link.url)) {
	                    is_in_other = true;
	                    break;
	                }
	            }
	            if (is_in_other) {
	                identical_links += 1.0;
	                link_counter--;
	            }
	        }
	        link_similarity = identical_links / link_counter;
	    } else {
	        //#logging.debug("Linkweight is 0.0")
	        link_weight = 0.0;
		}
	    double clickable_similarity = 0.0;
	    double identical_clickables = 0.0;
	    int clickable_counter = this.clickables.size() + other.clickables.size();
	    if (clickable_counter > 0) {
	        for (Clickable p1_clickable : this.clickables) {
	            boolean is_in_other = false;
	            for (Clickable p2_clickable : other.clickables) {
	                if (p1_clickable.equals(p2_clickable)) {
	                    is_in_other = true;
	                    break;
	                }
	            }
	            if (is_in_other) {
	                identical_clickables += 1.0;
	                clickable_counter--;
	            }
	        }
	        clickable_similarity = identical_clickables / clickable_counter;
	    } else {
	        clickable_weight = 0;
	    }

	    double sum_weight = clickable_weight + form_weight + link_weight;
	    double similarity = clickable_weight * clickable_similarity + form_weight * form_similarity + link_weight * link_similarity;
	    double result;
	    if (sum_weight > 0) {
	        result = similarity / sum_weight;
	    } else {
	        result = 1;
	    }

	    LOGGER.info("Result = {} Similarity = {} form_similarity = {} link_similarity = {}, clickable_similarity = {}", 1 - result, similarity, form_similarity, link_similarity, clickable_similarity);
	    //if verbose:
	    //    f = open("similarities/" + str(page1.id) + " - " + str(page2.id) + ".txt", "w")
	    //    f.write(page1.toString())
	    //    f.write(" \n \n ======================================================= \n \n")
	    //    f.write(page2.toString())
	    //    f.write("\n \n ====================Result=========================== \n \n")
	    //    f.write("Similarity = " + str(result) + " - Formsimilarity: " + str(form_similarity) + " - Linksimilarity: " + str(link_similarity) + " - Clickablesimilarity: " + str(clickable_similarity))
	    //    f.write("\n Formweight: "+ str(form_weight) + " Formnum: " +str(form_counter) + " - Linkweight: " + str(link_weight) + " Linknum: " + str(link_counter) + " - Clickableweight: " + str(clickable_weight) + " Clickablenum: " + str(clickable_counter) )
	    //    f.close()
	    //    #logging.debug("PageID: " + str(page1.id) + " and PageID: " + str(page2.id) + " has a similarity from: " + str(result))

	    return 1 - result;
	}

	@Override
	public boolean equals(Object object) {
		JAEKStateVertexImpl other = (JAEKStateVertexImpl) object;
		double distance = computeDistance(other);
		return distance <= threshold;

	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("id", super.getId())
				.add("name", super.getName()).toString();
	}

	@Override
	public double getDist(StateVertex vertexOfGraph) {
		if (vertexOfGraph instanceof JAEKStateVertexImpl) {
			JAEKStateVertexImpl vertex = (JAEKStateVertexImpl) vertexOfGraph;
			return computeDistance(vertex);
		}
		return -1;
	}
}
