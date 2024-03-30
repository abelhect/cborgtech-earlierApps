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
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.UserRef;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "social_groups")
public class Group extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String MYGROUPS = "MYGROUPS";
	public static final String JOINED = "JOINED";
	public static final String AVAILGROUPS = "AVAILGROUPS";
	private String name;
	private String description;
	private Long ownerRefId;
	private String access;
	private String statusColor;
	private String statusIcon;
	private Integer rating;
	private List<Discussion> discussions;
	private Set<UserRef> joiners;
	
	//Constructor
	public Group() {
		super();
	}
	public Group(String name, Long ownerRefId) {
		super();
		this.setName(name);
		this.setOwnerRefId(ownerRefId);
	}
	public Group(String name, Long ownerRefId, String statusColor, String statusIcon) {
		super();
		this.setName(name);
		this.setOwnerRefId(ownerRefId);
		this.setStatusColor(statusColor);
		this.setStatusIcon(statusIcon);
	}
	// JPA Constructor for list
	public Group(Long id, String name){
		this.setId(id);
		this.setName(name);
	}
	// Setter/Getter
	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "status_color")
	public String getStatusColor() {
		return statusColor;
	}
	public void setStatusColor(String statusColor) {
		this.statusColor = statusColor;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "status_icon")
	public String getStatusIcon() {
		return statusIcon;
	}
	public void setStatusIcon(String statusIcon) {
		this.statusIcon = statusIcon;
	}

	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "owner_id")
	public Long getOwnerRefId() {
		return ownerRefId;
	}
	public void setOwnerRefId(Long ownerRefId) {
		this.ownerRefId = ownerRefId;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Size(min = 1, max = 255)
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Size(min = 1, max = 2048)
	@Column(name = "description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "access")
	public String getAccess() {
		return access;
	}
	public void setAccess(String access) {
		this.access = access;
	}
	
	@JsonView({JsonViews.JsonMember.class})
	@Column(name = "rating")
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	@JsonIgnore
	@OneToMany(mappedBy = "group", cascade = CascadeType.ALL) @OrderBy("created desc")
	public List<Discussion> getDiscussions() {
		return discussions;
	}
	public void setDiscussions(List<Discussion> discussions) {
		this.discussions = discussions;
	}
	
	@JsonIgnore
	@ManyToMany(targetEntity = UserRef.class)
	@JoinTable(name = "social_groups_user_ref",joinColumns = @JoinColumn(name = "social_group_id"),inverseJoinColumns = @JoinColumn(name = "user_ref_id"))
	public Set<UserRef> getJoiners() {
		return joiners;
	}
	public void setJoiners(Set<UserRef> joiners) {
		this.joiners = joiners;
	}
	

	
}
