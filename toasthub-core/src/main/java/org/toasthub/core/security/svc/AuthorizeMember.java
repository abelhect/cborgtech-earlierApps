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

package org.toasthub.core.security.svc;

import java.util.Set;

import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.Interceptor;
import javax.interceptor.InvocationContext;

import org.toasthub.core.general.exception.AuthorizationViolationException;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.system.model.Role;

@Authorize @Interceptor
public class AuthorizeMember{

	@Inject UserContext login;
	
	private String minRole = "user";
	private int minRoleHierarchy = 1;
	private String roleCode = "ROLE_MEMBER";
	
	@AroundInvoke
	public Object checkAuthorization(InvocationContext joinPoint) throws Exception{
		System.out.println("In Check Authorization");
		Set<Role> roles = login.getCurrentUser().getRoles();
		boolean allowed = false;
		if (roles.size() > 0){
			for (Role role : roles){
				if (role.getCode().equals(this.roleCode) ){
					allowed = true;
					break;
				}
			}
			if (!allowed){
				throw new AuthorizationViolationException("You do not have enough privileges to perform this action");
			}
		} else {
			throw new AuthorizationViolationException("You do not have enough privileges to perform this action");
		}
		
		
		/* Get the name of the method being invoked. Need to link this to a permission table*/
		String methodName = joinPoint.getMethod().getName();
		/* Get the name of the object being invoked. */
		String objectName = joinPoint.getTarget().getClass().getName(); 
		System.out.println("Method name " + methodName + " Object name " + objectName);
		return joinPoint.proceed();
	}
	
	
}
