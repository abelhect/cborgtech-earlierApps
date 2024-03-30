package org.toasthub.core.general.model;

import java.io.Serializable;

/**
 * @author Edward H. Seufert
 * Licensed under Eclipse Public License 1.0 (EPL-1.0)
 */

public class ListItem implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private String name;
	
	private String value;
	
	public ListItem() {}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
