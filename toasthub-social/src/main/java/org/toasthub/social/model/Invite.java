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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.hibernate.validator.constraints.NotEmpty;
import org.toasthub.core.general.model.SendMailIntf;
import org.toasthub.core.general.model.ajax.JsonViews;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

@Entity
@XmlRootElement
@Table(name = "invites")
public class Invite extends SocialBaseEntity implements SendMailIntf, Serializable {

	private static final long serialVersionUID = 1L;
	public static final String PEND = "PEND";
	public static final String DENY = "DENY";
	public static final String ACCEPT = "ACPT";
	
	protected Long senderRefId;
	protected Long receiverRefId;
	private String subject;
	private String message;
	private String status;
	
	// constructors
	public Invite() {
		super();
	}
	
	public Invite(Long senderRefId,Long receiverRefId,String subject,String message){
		super();
		this.setSenderRefId(senderRefId);
		this.setReceiverRefId(receiverRefId);
		this.setStatus(PEND);
		this.setSubject(subject);
		this.setMessage(message);
	}
	// Constructor for ajax
	public Invite(RestRequest request, RestResponse response, String formName){
		this.setStatus(PEND);
		userInputHelper(request, response, formName);
		// handle hyphon elements
		
	}
	
	// setter/getters
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 2048)
	@Column(name = "message")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "sender_id")
	public Long getSenderRefId() {
		return senderRefId;
	}
	public void setSenderRefId(Long senderRefId) {
		this.senderRefId = senderRefId;
	}
	
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "receiver_id")
	public Long getReceiverRefId() {
		return receiverRefId;
	}
	public void setReceiverRefId(Long receiverRefId) {
		this.receiverRefId = receiverRefId;
	}
	
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 255)
	@Column(name = "subject")
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}
