package com.crawljax.examples.stateabstractions.dom.JAEK;


import com.crawljax.examples.stateabstractions.dom.JAEK.FormInput;
import java.util.List;

import java.security.*;
import org.apache.commons.codec.binary.Hex;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

public class HtmlForm {

	private List<FormInput> form_params;
	private String action;
	private String method;
	private String domAddress;


	public HtmlForm(List<FormInput> form_params, String action, String method, String domAddress) {
		this.form_params = form_params;
		this.action = action;
		this.method = method;
		this.domAddress = domAddress;
	}

	public String getHash() {
        //String s_to_hash = this.action.abstract_url + ";" + this.method + ";";
        String s_to_hash = this.action + ";" + this.method + ";";
        for (FormInput p : this.form_params) {
            s_to_hash += p.name + ";" + p.tag + ";" + p.input_type + ";";
        }
        byte[] b_to_hash = null;
        try {
        	b_to_hash = s_to_hash.getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
        	//nothing
        }

		MessageDigest md = null;
		try{
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			//nothing
		}
        return Hex.encodeHexString(md.digest(b_to_hash));
    }

	//def two_forms_are_equal(form1, form2):
    //    return form1.form_hash == form2.form_hash and form1.action.abstract_url == form2.action.abstract_url
    //TODO: abstract_url part doesn't make sense
	@Override
	public boolean equals(Object obj) {
	    if (this == obj)
	        return true;
	    if (obj == null)
	        return false;
	    if (!(obj instanceof HtmlForm))
	        return false;
	    HtmlForm other = (HtmlForm) obj;
	    return getHash().equals(other.getHash()) && this.action.equals(other.action);
	}
}
