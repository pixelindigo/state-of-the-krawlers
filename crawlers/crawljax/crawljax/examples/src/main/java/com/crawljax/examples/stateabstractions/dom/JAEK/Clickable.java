package com.crawljax.examples.stateabstractions.dom.JAEK;

public class Clickable {

	private String event;
	private String tag;
	private String domAddress;
	private String id;
	private String htmlClass;
	private String functionId;
	private String clickable_type;

	public Clickable(String event, String tag, String domAddress, String id, String htmlClass, String functionId) {
		this.event = event;
		this.tag = tag;
		this.domAddress = domAddress;
		this.id = id;
		this.htmlClass = htmlClass;
		this.functionId = functionId;
	}

	public Clickable(String event, String tag, String domAddress, String id, String htmlClass) {
		this(event, tag, domAddress, id, htmlClass, null);
	}

	// def two_clickables_are_equal(c1, c2):
    //     tmp = c1.event == c2.event and c1.dom_address == c2.dom_address and c1.tag == c2.tag
    //     if c1.clickable_type is not None and c2.clickable_type is not None:
    //         tmp = tmp and c1.clickable_type == c2.clickable_type
    //     return tmp
    @Override
	public boolean equals(Object obj) {
	    if (this == obj)
	        return true;
	    if (obj == null)
	        return false;
	    if (!(obj instanceof Clickable))
	        return false;
	    Clickable other = (Clickable) obj;
	    boolean tmp = this.event.equals(other.event) &&
	    this.domAddress.equals(other.domAddress) &&
	    this.tag.equals(other.tag);
	    if (this.clickable_type != null && other.clickable_type != null) {
	    	tmp = tmp && this.clickable_type.equals(other.clickable_type);
	    }
	    
	    return tmp;
	}
}
