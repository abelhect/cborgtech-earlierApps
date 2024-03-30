package org.toasthub.core.system.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@Table(name = "permission")
public class Permission extends ToastEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	protected Boolean canRead;
	protected Boolean canWrite;
	protected String code;
	protected Application application;
	
	protected Long applicationId;
	
	// constructors
	public Permission(){
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
	}
	
	public Permission(String code, Text title, Boolean canRead, Boolean canWrite) {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setCode(code);
		this.setTitle(title);
		this.setCanRead(canRead);
		this.setCanWrite(canWrite);
	}
	

	// Setters and getters
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "can_read")
	public Boolean getCanRead() {
		return canRead;
	}
	public void setCanRead(Boolean canRead) {
		this.canRead = canRead;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "can_write")
	public Boolean getCanWrite() {
		return canWrite;
	}
	public void setCanWrite(Boolean canWrite) {
		this.canWrite = canWrite;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@JsonIgnore
	@ManyToOne(targetEntity = Application.class)
	@JoinColumn(name = "application_id")
	public Application getApplication() {
		return this.application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Transient
	public Long getApplicationId() {
		if (this.application == null){
			return this.applicationId;
		} else {
			return this.application.id;
		}
	}
	public void setApplicationId(Long applicationId) {
		this.applicationId = applicationId;
	}
	
}
