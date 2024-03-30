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

package org.toasthub.core.preferences.sys.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;
import org.toasthub.core.system.model.BaseEntity;

@Entity
@XmlRootElement
@Table(name = "sys_page_name")
public class SysPageName extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private String name;
	private Text title;
	private Set<SysPageTextName> texts;
	private Set<SysPageFormFieldName> formFields;
	private Set<SysPageLabelName> labels;
	private Set<SysPageOptionName> options;
	
	// Constructor
	public SysPageName () {
		super();
	}
	// Methods
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@NotNull
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@ManyToOne(targetEntity = Text.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "text_id")
	public Text getTitle() {
		return title;
	}
	public void setTitle(Text title) {
		this.title = title;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@OneToMany(mappedBy = "pageName", cascade = CascadeType.ALL)
	public Set<SysPageTextName> getTexts() {
		return texts;
	}
	public void setTexts(Set<SysPageTextName> texts) {
		this.texts = texts;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@OneToMany(mappedBy = "pageName", cascade = CascadeType.ALL)
	public Set<SysPageFormFieldName> getFormFields() {
		return formFields;
	}
	public void setFormFields(Set<SysPageFormFieldName> formFields) {
		this.formFields = formFields;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@OneToMany(mappedBy = "pageName", cascade = CascadeType.ALL)
	public Set<SysPageLabelName> getLabels() {
		return labels;
	}
	public void setLabels(Set<SysPageLabelName> labels) {
		this.labels = labels;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@OneToMany(mappedBy = "pageName", cascade = CascadeType.ALL)
	public Set<SysPageOptionName> getOptions() {
		return options;
	}
	public void setOptions(Set<SysPageOptionName> options) {
		this.options = options;
	}
	
}
