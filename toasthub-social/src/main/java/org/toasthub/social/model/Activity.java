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
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "activities")
public class Activity extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private String messageShort;
	private String message;
	private Long userRefId;
	private String statusColor;
	private String statusIcon;
	//private Date eventTime;
	
	//Constructor
	public Activity() {
		super();
	}
	public Activity(String messageShort, Long userRefId) {
		super();
		this.setMessageShort(messageShort);
		this.setUserRefId(userRefId);
	}
	public Activity(String messageShort, Long userRefId, String statusColor, String statusIcon) {
		super();
		this.setMessageShort(messageShort);
		this.setUserRefId(userRefId);
		this.setStatusColor(statusColor);
		this.setStatusIcon(statusIcon);
	}
	// JPA Constructor for List
	public Activity(Long id, String messageShort, String statusColor){
		this.setId(id);
		this.setMessageShort(messageShort);
		this.setStatusColor(statusColor);
	}
	// Setter/Getter
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Size(max = 4096)
	@Column(name = "message")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "status_color")
	public String getStatusColor() {
		return statusColor;
	}
	public void setStatusColor(String statusColor) {
		this.statusColor = statusColor;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "status_icon")
	public String getStatusIcon() {
		return statusIcon;
	}
	public void setStatusIcon(String statusIcon) {
		this.statusIcon = statusIcon;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "user_id")
	public Long getUserRefId() {
		return userRefId;
	}
	public void setUserRefId(Long userRefId) {
		this.userRefId = userRefId;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Size(min = 1, max = 255)
	@Column(name = "message_short")
	public String getMessageShort() {
		return messageShort;
	}
	public void setMessageShort(String messageShort) {
		this.messageShort = messageShort;
	}

}
