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

package org.toasthub.core.general.svc;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;

@RequestScoped
public class LogOutSvc implements ServiceProcessor {

	@Inject UserContext userContext;
	@Inject UtilSvc utilSvc;
	
	// Constructors
	public LogOutSvc() {}
	
	// Processor
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		switch (action) {
		case "LOGOUT": 
			logout(request, response);
			break;
		default:
			break;
		}
		
		
	}
	
	public void logout(RestRequest request, RestResponse response) {
		// invalidate user context and terminate session
		utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, userContext.getLogout(), response);
		// log user activity
		
	}
	
	
	
}
