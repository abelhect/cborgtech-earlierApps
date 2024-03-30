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
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;
import org.toasthub.core.system.model.BaseEntity;

@Entity
@XmlRootElement
@Table(name = "sys_page_option_name")
public class SysPageOptionName extends BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	private SysPageName pageName;
	private String name;
	private Text title;
	private String valueType;
	private String defaultValue;
	private boolean useDefault;
	private String optionalParams;
	private Set<SysPageOptionValue> values;
	
	// Constructor 
	public SysPageOptionName() {
		super();
	}
	// Setters/Getter
	@JsonIgnore
	@NotNull
	@ManyToOne(targetEntity = SysPageName.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "page_name_id")
	public SysPageName getPageName() {
		return pageName;
	}
	public void setPageName(SysPageName pageName) {
		this.pageName = pageName;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@NotNull
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@JsonView({JsonViews.JsonAdminEdit.class})
	@ManyToOne(targetEntity = Text.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "text_id")
	public Text getTitle() {
		return title;
	}
	public void setTitle(Text title) {
		this.title = title;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "value_type")
	public String getValueType() {
		return valueType;
	}
	public void setValueType(String valueType) {
		this.valueType = valueType;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "default_value")
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonAdmin.class})
	@Column(name = "use_default")
	public boolean isUseDefault() {
		return useDefault;
	}
	public void setUseDefault(boolean useDefault) {
		this.useDefault = useDefault;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "optional_params")
	public String getOptionalParams() {
		return optionalParams;
	}
	public void setOptionalParams(String optionalParams) {
		this.optionalParams = optionalParams;
	}
	
	@JsonView({JsonViews.JsonAdminEdit.class})
	@OneToMany(mappedBy = "pageOptionName")
	public Set<SysPageOptionValue> getValues() {
		return values;
	}
	public void setValues(Set<SysPageOptionValue> values) {
		this.values = values;
	}
	
}
