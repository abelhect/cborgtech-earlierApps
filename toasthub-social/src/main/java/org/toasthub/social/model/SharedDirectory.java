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

package org.toasthub.social.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Directory;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "shared_directories")
public class SharedDirectory extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String RO = "RO";
	public static final String RW = "RW";
	private Long receiverRefId;
	private Directory directory;
	private String permission;
	
	//Constructor
	public SharedDirectory() {
		super();
		this.setPermission(SharedDirectory.RO);
	}

	@JsonIgnore
	@JoinColumn(name = "receiver_id")
	public Long getReceiverRefId() {
		return receiverRefId;
	}
	public void setReceiverRefId(Long receiverRefId) {
		this.receiverRefId = receiverRefId;
	}

	@JsonView({JsonViews.JsonMember.class})
	@ManyToOne(targetEntity = Directory.class)
	@JoinColumn(name = "directory_id")
	public Directory getDirectory() {
		return directory;
	}
	public void setDirectory(Directory directory) {
		this.directory = directory;
	}

	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "permission")
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	
}
