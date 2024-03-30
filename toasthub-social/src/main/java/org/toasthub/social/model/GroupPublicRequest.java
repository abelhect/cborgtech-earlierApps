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
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;


@Entity
@XmlRootElement
@Table(name = "social_group_public_request")
public class GroupPublicRequest extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String APRV = "APRV";
	public static final String REJT = "REJT";
	public static final String PEND = "PEND";
	private String status;
	private String message;
	private Long senderRefId;
	private Group group;
	private String groupName;
	
	//Constructor
	public GroupPublicRequest() {
		super();
	}
	public GroupPublicRequest(Group group, Long senderRefId, String message) {
		super();
		this.setStatus(GroupPublicRequest.PEND);
		this.setGroup(group);
		this.setSenderRefId(senderRefId);
		this.setMessage(message);
	}
	
	// JPA Constructor for list
	public GroupPublicRequest(Long id, String message){
		this.setId(id);
		this.setMessage(message);
	}
	public GroupPublicRequest(Long id, String status, String message, Long senderRefId, String groupName){
		this.setId(id);
		this.setStatus(status);
		this.setMessage(message);
		this.setSenderRefId(senderRefId);
		this.setGroupName(groupName);
	}
	// Setter/Getter
	
	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@JsonView({JsonViews.JsonMember.class})
	@Size(min = 1, max = 2048)
	@Column(name = "message")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "sender_id")
	public Long getSenderRefId() {
		return this.senderRefId;
	}
	public void setSenderRefId(Long senderRefId) {
		this.senderRefId = senderRefId;
	}

	@JsonIgnore
	@ManyToOne(targetEntity = Group.class,fetch = FetchType.LAZY)
	@JoinColumn(name = "group_id")
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Transient
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	

}