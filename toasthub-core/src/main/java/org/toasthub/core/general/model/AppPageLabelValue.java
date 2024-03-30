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
@Table(name = "page_label_value")
public class AppPageLabelValue extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	private AppPageLabelName pageLabelName;
	private String value;
	private String lang;
	private Boolean rendered;
	private Long order;
	// make output simple on preference object
	private String name;
	private String className;
	private String tabIndex;
	private String optionalParams;
		
	// Constructor
	public AppPageLabelValue() {
		super();
	}
	
	public AppPageLabelValue(Long id, String value, String lang, Boolean rendered, Long order, String name, String className, String tabIndex, String optionalParams){
		this.setId(id);
		this.setValue(value);
		this.setLang(lang);
		this.setRendered(rendered);
		this.setOrder(order);
		this.setName(name);
		this.setClassName(className);
		this.setTabIndex(tabIndex);
		this.setOptionalParams(optionalParams);
	}
	
	// Setters/Getters
	@JsonIgnore
	@ManyToOne(targetEntity = AppPageLabelName.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "page_label_name_id")
	public AppPageLabelName getPageLabelName() {
		return pageLabelName;
	}
	public void setPageLabelName(AppPageLabelName pageLabelName) {
		this.pageLabelName = pageLabelName;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "label_value")
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
	@Column(name = "sort_order")
	public Long getOrder() {
		return order;
	}
	public void setOrder(Long order) {
		this.order = order;
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
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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

}
