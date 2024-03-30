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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;
import org.toasthub.core.system.model.BaseEntity;

@Entity
@XmlRootElement
@Table(name = "sys_page_label_value")
public class SysPageLabelValue extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;

	private SysPageLabelName pageLabelName;
	private String value;
	private String lang;
	private boolean rendered;
	private Long order;
	
	// Constructor
	public SysPageLabelValue() {
		super();
	}
	// Setters/Getters
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class,JsonViews.JsonAdminEdit.class})
	@NotNull
	@ManyToOne(targetEntity = SysPageLabelName.class)
	@JoinColumn(name = "page_label_name_id")
	public SysPageLabelName getPageLabelName() {
		return pageLabelName;
	}
	public void setPageLabelName(SysPageLabelName pageLabelName) {
		this.pageLabelName = pageLabelName;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class,JsonViews.JsonAdminEdit.class})
	@Column(name = "label_value")
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class,JsonViews.JsonAdminEdit.class})
	@NotNull
	@Column(name = "lang")
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class,JsonViews.JsonAdminEdit.class})
	@Column(name = "rendered")
	public boolean isRendered() {
		return rendered;
	}
	public void setRendered(boolean rendered) {
		this.rendered = rendered;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class,JsonViews.JsonAdminEdit.class})
	@Column(name = "sort_order")
	public Long getOrder() {
		return order;
	}
	public void setOrder(Long order) {
		this.order = order;
	}
	
}
