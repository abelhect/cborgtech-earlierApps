package org.toasthub.core.general.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@Table(name = "category")
public class UserRef implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long refId;
	
	// Constructor
	public UserRef() {}
	
	public UserRef(Long refId) {
		this.refId = refId;
	}
	
	// Setter/Getter
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	@Column(name = "id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "ref_id")
	public Long getRefId() {
		return refId;
	}
	public void setRefId(Long refId) {
		this.refId = refId;
	}
}
