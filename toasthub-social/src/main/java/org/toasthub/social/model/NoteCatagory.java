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
@Table(name = "note_catagory")
public class NoteCatagory extends SocialBaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private String name;
	
	// Constructor
	public NoteCatagory() {
		super();
	}
	
	// Methods
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 255)
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
