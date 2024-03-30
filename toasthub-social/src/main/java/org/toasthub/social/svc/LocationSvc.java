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
import org.toasthub.core.general.model.AppCachePage;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.security.svc.Authorize;
import org.toasthub.social.dao.LocationDaoIface;
import org.toasthub.social.dao.LocationDaoQual;
import org.toasthub.social.model.Location;

@RequestScoped
public class LocationSvc implements ServiceProcessor {

	@Inject @LocationDaoQual LocationDaoIface locationDao;
	@Inject UtilSvc utilSvc;
	@Inject	AppCachePage appCachePage;
	
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParam("action");
		// get option from main
		request.addParam("sysPageFormName", "SOCIAL_LOCATION");
		request.addParam("sysPageLabelName", "SOCIAL_LOCATION");
		request.addParam("sysPageTextName", "SOCIAL_LOCATION");
		
		Long count = 0l;
		switch (action) {
		case "INIT": 
			itemCount(request, response);
			count = (Long) response.getParam("count");
			if (count != null && count > 0){
				items(request, response);
			}
			break;
		case "LIST":
			itemCount(request, response);
			count = (Long) response.getParam("count");
			if (count != null && count > 0){
				items(request, response);
			}
			break;
		case "SHOW":
			item(request, response);
			break;
		case "SAVE":
			appCachePage.getPageInfo(request,response);
			
			Location location = new Location(request, response, "SOCIAL_LOCATION");
			request.addParam("location", location);
			try {
				save(request, response);
			} catch (PrivilegesException pe){
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.SERVERERROR, pe.getMessage(), response);
			} catch (Exception e) {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
				e.printStackTrace();
			}
			break;
		case "DELETE":
			try {
				delete(request, response);
			} catch (PrivilegesException pe){
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.SERVERERROR, pe.getMessage(), response);
			} catch (Exception e) {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
				e.printStackTrace();
			}
			break;
		case "ACQUAINTANCE_LOCATIONS":
			getAcquaintanceLocations(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	protected void itemCount(RestRequest request, RestResponse response) {
		try {
			locationDao.itemCount(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Count failed", response);
			e.printStackTrace();
		}
	}
	
	protected void items(RestRequest request, RestResponse response) {
		try {
			locationDao.items(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "List failed", response);
			e.printStackTrace();
		}
	}
	
	protected void item(RestRequest request, RestResponse response) {
		try {
			locationDao.item(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Item Failed", response);
			e.printStackTrace();
		}
	}
	
	@Authorize
	protected void save(RestRequest request, RestResponse response) throws Exception {
		locationDao.save(request, response);
		utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
	}
	
	@Authorize
	protected void delete(RestRequest request, RestResponse response) throws Exception {
		locationDao.delete(request, response);
		utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete successful", response);
	}
	
	protected void getAcquaintanceLocations(RestRequest request, RestResponse response) {
		try {
			locationDao.getAcquaintanceLocations(request, response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Location search Failed", response);
			e.printStackTrace();
		}
	}
}
