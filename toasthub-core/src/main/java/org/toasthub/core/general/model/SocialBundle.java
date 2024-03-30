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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "social_bundles")
public class SocialBundle extends Bundle implements Serializable{

	private static final long serialVersionUID = 1L;
	private int acquaintanceLimit;
	private int activityLimit;
	private int portalLimit;
	private int eventLimit;
	private int groupLimit;
	private int inviteLimit;
	private int messageLimit;
	
	// Constructors
	public SocialBundle(){
		super();
	}
	// Setter/Getters
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "acquaintance_limit")
	public int getAcquaintanceLimit() {
		return acquaintanceLimit;
	}
	public void setAcquaintanceLimit(int acquaintanceLimit) {
		this.acquaintanceLimit = acquaintanceLimit;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "activity_limit")
	public int getActivityLimit() {
		return activityLimit;
	}
	public void setActivityLimit(int activityLimit) {
		this.activityLimit = activityLimit;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "portal_limit")
	public int getPortalLimit() {
		return portalLimit;
	}
	public void setPortalLimit(int portalLimit) {
		this.portalLimit = portalLimit;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "event_limit")
	public int getEventLimit() {
		return eventLimit;
	}
	public void setEventLimit(int eventLimit) {
		this.eventLimit = eventLimit;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "group_limit")
	public int getGroupLimit() {
		return groupLimit;
	}
	public void setGroupLimit(int groupLimit) {
		this.groupLimit = groupLimit;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "invite_limit")
	public int getInviteLimit() {
		return inviteLimit;
	}
	public void setInviteLimit(int inviteLimit) {
		this.inviteLimit = inviteLimit;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "message_limit")
	public int getMessageLimit() {
		return messageLimit;
	}
	public void setMessageLimit(int messageLimit) {
		this.messageLimit = messageLimit;
	}
}
