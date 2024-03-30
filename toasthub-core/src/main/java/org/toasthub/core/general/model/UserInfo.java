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
import java.util.Map;

import javax.ejb.Remove;
import javax.ejb.Startup;
import javax.ejb.Stateful;

import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.User;

@Stateful
@Startup
public class UserInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long userId;
	private User user;
	private Map<String,Map<String,Role>> roles;
	//Constructor
	public UserInfo(){}
	
	// Methods
	@Remove
	public void remove(){
		
	}
	
	public boolean hasRole(String roleCode, String permissionCode , String applicationCode) {
		if (user.getRoles() != null){
    		for(Role role : user.getRoles()){
    			if (role.getCode().equals(roleCode) && role.getApplication().getCode().equals(applicationCode) && role.isActive()){
    				return true;
    			}
    		}
    	}
		return false;
	}

	public Map<String,Map<String,Role>> getRoles() {
		return roles;
	}

	public void setRoles(Map<String,Map<String,Role>> roles) {
		this.roles = roles;
	}

	public Long getUserIdx() {
		return userId;
	}

	public void setUserIdx(Long userId) {
		this.userId = userId;
	}

	public User getUserx() {
		return user;
	}

	public void setUserx(User user) {
		this.user = user;
	}

	
}
