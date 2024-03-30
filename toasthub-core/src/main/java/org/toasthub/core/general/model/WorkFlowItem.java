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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.toasthub.core.general.model.Text;
import org.toasthub.core.general.model.ajax.JsonViews;

@Entity
@Table(name = "workflow_item")
public class WorkFlowItem extends BaseEntity implements Serializable {
private static final long serialVersionUID = 1L;
	
	public static final String WORKFLOWITEM = "workFlowItem";
	public static final String WORKFLOWITEMS = "workFlowItems";
	public static final String ID = "workFlowItemId";
	
	private Text name;
	private String code;
	private WorkFlow workFlow;
	private int order;
	
	// Constructor
	public WorkFlowItem(){
		super();
	}
	
	public WorkFlowItem(String code, Text name){
		super();
		setCode(code);
		setName(name);
	}
	
	// Setter/Getter
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@ManyToOne(targetEntity = Text.class)
	@JoinColumn(name = "name_id", nullable = false)
	public Text getName() {
		return name;
	}
	public void setName(Text name) {
		this.name = name;
	}
	
	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	@JsonIgnore
	@ManyToOne(targetEntity = WorkFlow.class)
	@JoinColumn(name = "workflow_id")
	public WorkFlow getWorkFlow() {
		return workFlow;
	}
	public void setWorkFlow(WorkFlow workFlow) {
		this.workFlow = workFlow;
	}

	@JsonView({JsonViews.JsonMember.class,JsonViews.JsonAdmin.class})
	@Column(name = "flow_order")
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
}
