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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@Table(name = "category")
public class Category extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	public static final String CATEGORY = "category";
	public static final String CATEGORIES = "categories";
	public static final String ID = "categoryId";
	
	private String group;
	private Text name;
	private String code;
	private Category parent;
	private int order;
	
	// Constructor
	public Category() {
		super();
	}
	
	public Category(String group, Text name, String code){
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		setGroup(group);
		setName(name);
		setCode(code);
	}

	// Setters/Getters
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "category_group")
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@ManyToOne(targetEntity = Text.class)
	@JoinColumn(name = "name_id", nullable = false)
	public Text getName() {
		return name;
	}
	public void setName(Text name) {
		this.name = name;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "code", nullable = false)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	@JsonView({JsonViews.JsonAdmin.class})
	@ManyToOne(targetEntity = Category.class)
	@JoinColumn(name = "parent_id")
	public Category getParent() {
		return parent;
	}
	public void setParent(Category parent) {
		this.parent = parent;
	}
	
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "category_order")
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
}
