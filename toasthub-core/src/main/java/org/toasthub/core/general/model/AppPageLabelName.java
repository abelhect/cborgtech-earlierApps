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
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.ajax.JsonViews;


@Entity
@XmlRootElement
@Table(name = "page_label_name")
public class AppPageLabelName extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	private AppPageName pageName;
	private String name;
	private Text title;
	private String className;
	private String tabIndex;
	private String optionalParams;
	private Set<AppPageLabelValue> values;
	
	// Constructor
	public AppPageLabelName() {
		super();
	}
	
	public AppPageLabelName (AppPageName pageName, String name, Text Title) {
		super();
		this.setPageName(pageName);
		this.setName(name);
		this.setTitle(title);
	}
	
	public AppPageLabelName (String name, String className, String tabIndex, String optionalParams) {
		this.setName(name);
		this.setClassName(className);
		this.setTabIndex(tabIndex);
		this.setOptionalParams(optionalParams);
	}
	
	// Setters/Getters
	@JsonIgnore
	@NotNull
	@ManyToOne(targetEntity = AppPageName.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "page_name_id", nullable = false)
	public AppPageName getPageName() {
		return pageName;
	}
	public void setPageName(AppPageName pageName) {
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
	
	@JsonView({JsonViews.JsonAdmin.class})
	@ManyToOne(targetEntity = Text.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "text_id")
	public Text getTitle() {
		return title;
	}
	public void setTitle(Text title) {
		this.title = title;
	}

	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "class_name")
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "tab_index")
	public String getTabIndex() {
		return tabIndex;
	}
	public void setTabIndex(String tabIndex) {
		this.tabIndex = tabIndex;
	}
	
	@JsonView({JsonViews.JsonPublic.class,JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "optional_params")
	public String getOptionalParams() {
		return optionalParams;
	}
	public void setOptionalParams(String optionalParams) {
		this.optionalParams = optionalParams;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@OneToMany(mappedBy = "pageLabelName", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	public Set<AppPageLabelValue> getValues() {
		return values;
	}
	public void setValues(Set<AppPageLabelValue> values) {
		this.values = values;
	}
	
	@Transient
	public void setTitleDefaultText(String defaultText){
		if (this.title != null) {
			this.title.setDefaultText(defaultText);
		} else {
			Text text = new Text();
			text.setDefaultText(defaultText);
			this.setTitle(text);
		}
	}
	
	@Transient
	public void setTitleMtext(Map<String,String> langMap){
		if (this.title != null) {
			this.title.setLangTexts(langMap);
		} else {
			Text text = new Text();
			text.setLangTexts(langMap);
			this.setTitle(text);
		}
	}
	
	@Transient
	public void setMValues(Map<String,String> langMap) {
		String field = langMap.get(BaseEntity.FIELD);
		langMap.remove(BaseEntity.FIELD);
		if (this.values == null) {
			values = new HashSet<AppPageLabelValue>();
		}
		// loop through langMap
		for (String key : langMap.keySet()) {
			// loop through existing values to find match
			boolean added = false;
			for (AppPageLabelValue v : values){
				if (v.getLang().equals(key)){
					switch (field) {
					case "value":
						v.setValue(langMap.get(key));
						break;
					case "rendered":
						v.setRendered(Boolean.parseBoolean(langMap.get(key)));
						break;
					}
					added = true;
					break;
				} 
			}
			if (!added) {
				// lang does not exist create a new one
				AppPageLabelValue val = new AppPageLabelValue();
				val.setLang(key);
				val.setOrder(0l);
				val.setPageLabelName(this);
				val.setActive(true);
				val.setArchive(false);
				val.setLocked(false);
				switch (field) {
				case "value":
					val.setValue(langMap.get(key));
					break;
				case "rendered":
					val.setRendered(Boolean.parseBoolean(langMap.get(key)));
					break;
				}
				values.add(val);
			}
		}
	}

}
