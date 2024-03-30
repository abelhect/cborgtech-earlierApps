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

package org.toasthub.admin.preferences.svc;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.admin.preferences.dao.AppPageAdminDaoIface;
import org.toasthub.admin.preferences.dao.AppPageAdminDaoQual;
import org.toasthub.core.general.model.AppCachePage;
import org.toasthub.core.general.model.AppPageName;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.preferences.svc.AppPageSvc;
import org.toasthub.core.security.svc.Authorize;

// Service name APPPAGE_SVC
@AppPageAdminSvcQual
@RequestScoped
public class AppPageAdminSvc extends AppPageSvc implements ServiceProcessor, AppPageAdminSvcIface {

	@Inject @AppPageAdminDaoQual AppPageAdminDaoIface appPageDao;
	@Inject	AppCachePage appCachePage;
	@Inject UtilSvc utilSvc;
	

	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		Long count = 0l;
		switch (action) {
		case "INIT":
			request.addParam("appPageParamLoc", "response");
			appCachePage.getPageInfo(request,response);
			itemCount(request, response);
			count = (Long) response.getParam(BaseEntity.ITEMCOUNT);
			if (count != null && count > 0){
				items(request, response);
			}
			break;
		case "LIST":
			itemCount(request, response);
			count = (Long) response.getParam(BaseEntity.ITEMCOUNT);
			if (count != null && count > 0){
				items(request, response);
			}
			break;
		case "SHOW":
			this.item(request, response);
			break;
		case "DELETE":
			this.delete(request, response);
			break;
		case "SAVE":
			appCachePage.getPageInfo(request,response);
			this.save(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
		
	}
	
	
	@Authorize
	public void save(RestRequest request, RestResponse response) {
		try {
			// validate
			utilSvc.validateParams(request, response);
			
			if ((Boolean) request.getParam(BaseEntity.VALID) == false) {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Validation Error", response);
				return;
			}
			
			// get existing item
			if (request.containsParam(BaseEntity.ITEMID) && !request.getParam(BaseEntity.ITEMID).equals("")) {
				appPageDao.item(request, response);
				request.addParam(BaseEntity.ITEM, response.getParam(BaseEntity.ITEM));
				response.getParams().remove(BaseEntity.ITEM);
			} else {
				AppPageName p = new AppPageName();
				p.setArchive(false);
				p.setLocked(false);
				request.addParam(BaseEntity.ITEM, p);
			}
			
			// marshall
			utilSvc.marshallFields(request, response);
						
			appPageDao.save(request, response);
			
			// no need to clear cache here need to make sub items first
					
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
	
	@Authorize
	public void delete(RestRequest request, RestResponse response) {
		try {
			appPageDao.delete(request, response);
			// need to clear all caches
			appCachePage.clearAppCache();
			
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
			e.printStackTrace();
		}
	}
}
