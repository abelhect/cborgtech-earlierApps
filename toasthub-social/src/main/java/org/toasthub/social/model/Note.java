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
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.hibernate.validator.constraints.NotEmpty;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "notes")
public class Note extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private int page;
	private int seq;
	private String note;
	private NoteCatagory catagory;
	
	// Constructor
	public Note() {
		super();
	}
	
	// Methods
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Column(name = "page")
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Column(name = "seq")
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "note")
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@ManyToOne(targetEntity = NoteCatagory.class)
	@JoinColumn(name = "cat_id")
	public NoteCatagory getCatagory() {
		return catagory;
	}
	public void setCatagory(NoteCatagory catagory) {
		this.catagory = catagory;
	}

	
}
