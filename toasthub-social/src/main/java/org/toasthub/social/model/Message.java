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
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "messages")
public class Message extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long receiverRefId;
	private Long senderRefId;
	private String subject;
	private String message;
	private boolean senderArchive;
	private boolean receiverArchive;
	private boolean receiverViewed;
	
	// Constructor
	public Message() {
		super();
	}
	public Message(String subject) {
		super();
		this.setSubject(subject);
	}
	// Getters/Setters
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
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
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
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
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "sender_archive")
	public boolean isSenderArchive() {
		return senderArchive;
	}
	public void setSenderArchive(boolean senderArchive) {
		this.senderArchive = senderArchive;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "receiver_archive")
	public boolean isReceiverArchive() {
		return receiverArchive;
	}
	public void setReceiverArchive(boolean receiverArchive) {
		this.receiverArchive = receiverArchive;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "receiver_viewed")
	public boolean isReceiverViewed() {
		return receiverViewed;
	}
	public void setReceiverViewed(boolean receiverViewed) {
		this.receiverViewed = receiverViewed;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Column(name = "receiver_id")
	public Long getReceiverRefId() {
		return receiverRefId;
	}
	public void setReceiverRefId(Long receiverRefId) {
		this.receiverRefId = receiverRefId;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Column(name = "sender_id")
	public Long getSenderRefId() {
		return senderRefId;
	}
	public void setSenderRefId(Long senderRefId) {
		this.senderRefId = senderRefId;
	}
	
}
