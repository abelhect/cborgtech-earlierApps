package org.toasthub.core.system.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Table;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@Table(name = "application")
public class Application extends ToastEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	protected String code;
	
	// Constructors
	public Application() {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
	}
	
	public Application(String code, Text name) {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setCode(code);
		this.setTitle(title);
	}
	
	// Methods
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
