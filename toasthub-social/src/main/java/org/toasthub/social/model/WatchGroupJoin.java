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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "watch_group_members")
public class WatchGroupJoin implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long id;
	private Long userRefId;
	private WatchGroup watchGroup;
	
	//Constructor
	public WatchGroupJoin() {
	}
	
	public WatchGroupJoin(Long userRefId, WatchGroup watchGroup){
		this.userRefId = userRefId;
		this.watchGroup = watchGroup;
	}
	
	// Setter/Getter
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY) 
	@Column(name = "id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "app_user_id")
	public Long getUserRefId() {
		return userRefId;
	}
	public void setUserRefId(Long userRefId) {
		this.userRefId = userRefId;
	}

	@ManyToOne(targetEntity = WatchGroup.class)
	@JoinColumn(name = "watch_group_id")
	public WatchGroup getWatchGroup() {
		return watchGroup;
	}
	public void setWatchGroup(WatchGroup watchGroup) {
		this.watchGroup = watchGroup;
	}

}
