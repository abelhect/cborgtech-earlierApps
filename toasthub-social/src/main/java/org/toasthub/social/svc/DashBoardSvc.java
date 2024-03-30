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

package org.toasthub.social.svc;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.exception.PrivilegesException;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.social.dao.DashBoardDao;

@RequestScoped
public class DashBoardSvc implements ServiceProcessor {

	@Inject DashBoardDao dashBoardDao;
	@Inject UtilSvc utilSvc;

	public void process(RestRequest request, RestResponse response) {
		response.addParam("appName", "eternal");
		response.addParam("contextPath", "dodream");
		
		String action = (String) request.getParams().get("action");
		
		switch (action) {
		case "INIT": 
			this.getPortals(request, response);
			break;
		case "LIST":
			this.getPortals(request, response);
			break;
		case "LIST_AVAILABLE":
			this.getAvailablePortals(request, response);
			break;
		case "SHOW":
			
			break;
		case "DELETE":
			
			break;
		case "SAVE":
			if((Boolean) request.getParam("allPortals")){
				this.addAllPortals(request, response);
			} else {
				if (request.getParam("availablePortal") != null){
					this.addPortal(request, response);
				} else {
					utilSvc.addStatus(RestResponse.INFO, RestResponse.MISSINGPARAM, "You must supply a available portal id", response);
				}
			}
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
		
	}
	
	
	public void getPortals(RestRequest request, RestResponse response) {
		dashBoardDao.getPortals(request, response);
	}

	public void getAvailablePortals(RestRequest request, RestResponse response) {
		dashBoardDao.getAvailablePortals(request, response);
	}

	public void addPortal(RestRequest request, RestResponse response) {
		try {
			dashBoardDao.addPortal(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Portal Add Successful", response);
		} catch (PrivilegesException pe){
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, pe.getMessage(), response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Portal Add Failed", response);
			e.printStackTrace();
		}
	}

	public void addAllPortals(RestRequest request, RestResponse response) {
		try {
			dashBoardDao.addAllPortals(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Add all available portals Successful", response);
		} catch (PrivilegesException pe){
			utilSvc.addStatus(RestResponse.SUCCESS, RestResponse.ACTIONFAILED, pe.getMessage(), response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Add all available portals Failed", response);
			e.printStackTrace();
		}
	}

}
