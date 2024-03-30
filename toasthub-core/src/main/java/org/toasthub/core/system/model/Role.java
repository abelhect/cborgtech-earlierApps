/*
 * Copyright (C) 2016 The ToastHub Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.toasthub.core.system.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;

/**
 * @author Edward H. Seufert
 */
@Entity
@Table(name = "role")
public class Role extends ToastEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	protected String code;
	protected Application application;
	protected Set<Permission> permissions;
	
	protected Long applicationId;
	protected Set<Long> permissionIds;
	
	// Constructors
	public Role() {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
	}
	
	public Role(Text title) {
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setTitle(title);
	}
	
	// Setter/Getters
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@JsonIgnore
	@ManyToMany(targetEntity = Permission.class, fetch = FetchType.EAGER)
	@JoinTable(name = "role_permission", joinColumns = @JoinColumn(name = "role_id"), inverseJoinColumns = @JoinColumn(name = "permission_id"))
	public Set<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
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
	
	@JsonIgnore
	@Transient
	public Set<Long> getPermissionIds() {
		if (this.permissions == null){
			return this.permissionIds;
		} else {
			return new HashSet<Long>();
		}
	}
	public void setPermissoinIds(Set<Long> permissionIds) {
		this.permissionIds = permissionIds;
	}
}
