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

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@XmlRootElement
@Table(name = "page_form_field_value")
public class AppPageFormFieldValue extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private AppPageFormFieldName pageFormFieldName;
	private String value;
	private String label;
	private String lang;
	private Boolean rendered;
	private Boolean required;
	private Long order;
	private String validation;
	private String image;
	private AppPageFormFieldValue subElement;
	// make output simple for preference object
	private String name;
	private String fieldType;
	private String htmlType;
	private String className;
	private String group;
	private String subGroup;
	private String tabIndex;
	private String optionalParams;
	private String classModel;
	
	// Constructor
	public AppPageFormFieldValue() {
		super();
	}
	
	// Contructor for fields 
	public AppPageFormFieldValue(Long id,String value, String label, String lang, Boolean rendered, 
			Boolean required, Long order, String validation, String image, String name, String fieldType,
			String htmlType, String className, String group, String subGroup, String tabIndex, 
			String optionalParams, String classModel) {
		this.setId(id);
		this.setValue(value);
		this.setLabel(label);
		this.setLang(lang);
		this.setRendered(rendered);
		this.setRequired(required);
		this.setOrder(order);
		this.setValidation(validation);
		this.setImage(image);
		// 
		this.setName(name);
		this.setFieldType(fieldType);
		this.setHtmlType(htmlType);
		this.setClassName(className);
		this.setGroup(group);
		this.setSubGroup(subGroup);
		this.setTabIndex(tabIndex);
		this.setOptionalParams(optionalParams);
		this.setClassModel(classModel);
		//this.setPageFormFieldName(new AppPageFormFieldName(name, fieldType, htmlType, className, group, 
		//		subGroup, tabIndex, optionalParams, jclassName, jfieldName));
	}
	
	
	
	// Setters/Getters
	@JsonIgnore
	@ManyToOne(targetEntity = AppPageFormFieldName.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "page_form_field_name_id")
	public AppPageFormFieldName getPageFormFieldName() {
		return pageFormFieldName;
	}
	public void setPageFormFieldName(AppPageFormFieldName pageFormFieldName) {
		this.pageFormFieldName = pageFormFieldName;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "field_value")
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "lang")
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "rendered")
	public Boolean getRendered() {
		return rendered;
	}
	public void setRendered(Boolean rendered) {
		this.rendered = rendered;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "required")
	public Boolean getRequired() {
		return required;
	}
	public void setRequired(Boolean required) {
		this.required = required;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "sort_order")
	public Long getOrder() {
		return order;
	}
	public void setOrder(Long order) {
		this.order = order;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "validation")
	public String getValidation() {
		return validation;
	}
	public void setValidation(String validation) {
		this.validation = validation;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "field_label")
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}

	@JsonIgnore
	@ManyToOne(targetEntity = AppPageFormFieldValue.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "sub_element_id")
	public AppPageFormFieldValue getSubElement() {
		return subElement;
	}
	public void setSubElement(AppPageFormFieldValue subElement) {
		this.subElement = subElement;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "image_path")
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getHtmlType() {
		return htmlType;
	}
	public void setHtmlType(String htmlType) {
		this.htmlType = htmlType;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getSubGroup() {
		return subGroup;
	}
	public void setSubGroup(String subGroup) {
		this.subGroup = subGroup;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getTabIndex() {
		return tabIndex;
	}
	public void setTabIndex(String tabIndex) {
		this.tabIndex = tabIndex;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Transient
	public String getOptionalParams() {
		return optionalParams;
	}
	public void setOptionalParams(String optionalParams) {
		this.optionalParams = optionalParams;
	}

	@JsonIgnore
	@Transient
	public String getClassModel() {
		return classModel;
	}
	public void setClassModel(String classModel) {
		this.classModel = classModel;
	}

}
