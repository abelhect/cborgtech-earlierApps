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

package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "directories")
public class Directory extends BaseEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	
	public static final String DIRECTORY = "directory";
	public static final String DIRECTORIES = "directories";
	public static final String ID = "directoryId";
	public static final String PARENT = "parent";
	public static final String OWNER = "owner";
	
	public static final String MINE = "MINE";
	public static final String SHARED = "SHARED";
	
	private String name;
	private Long ownerRefId;
	private Directory parent;
	private List<AttachmentMeta> files;
	
	//Constructor
	public Directory() {
		super();
	}
	public Directory(String name,Long ownerRefId){
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setName(name);
		this.setOwnerRefId(ownerRefId);
	}

	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@JsonIgnore
	@Column(name = "owner_id")
	public Long getOwnerRefId() {
		return ownerRefId;
	}
	public void setOwnerRefId(Long ownerRefId) {
		this.ownerRefId = ownerRefId;
	}

	@JsonIgnore
	@ManyToOne(targetEntity = Directory.class)
	@JoinColumn(name = "parent_id")
	public Directory getParent() {
		return parent;
	}
	public void setParent(Directory parent) {
		this.parent = parent;
	}

	@JsonIgnore
	@OneToMany(mappedBy = "directory", cascade = CascadeType.ALL) @OrderBy("fileName asc")
	public List<AttachmentMeta> getFiles() {
		return files;
	}
	public void setFiles(List<AttachmentMeta> files) {
		this.files = files;
	}
	
	@JsonIgnore
	@Transient
	public void marshallFields(Map params){
		if (params.containsKey("name")){
			setName((String)params.get("name"));
		}
	}
}
