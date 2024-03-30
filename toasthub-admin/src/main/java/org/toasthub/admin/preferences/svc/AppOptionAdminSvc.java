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

import org.toasthub.admin.preferences.dao.AppOptionAdminDaoIface;
import org.toasthub.admin.preferences.dao.AppOptionAdminDaoQual;
import org.toasthub.core.general.model.AppCachePage;
import org.toasthub.core.general.model.AppPageOptionName;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.preferences.svc.AppOptionSvc;
import org.toasthub.core.security.svc.Authorize;

// Service name APPOPTION_SVC
@AppOptionAdminSvcQual
@RequestScoped
public class AppOptionAdminSvc extends AppOptionSvc implements ServiceProcessor, AppOptionAdminSvcIface {

	@Inject @AppOptionAdminDaoQual AppOptionAdminDaoIface optionDao;
	@Inject	AppCachePage appCachePage;
	@Inject UtilSvc utilSvc;
	
	@Override
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		appCachePage.getPageInfo(request,response);
		Long count = 0l;
		switch (action) {
		case "INIT":
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
			response.addParam(BaseEntity.PARENTID, request.getParam(BaseEntity.PARENTID));
			break;
		case "SHOW":
			this.item(request, response);
			break;
		case "DELETE":
			this.delete(request, response);
			break;
		case "SAVE":
			this.save(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	@Authorize
	public void delete(RestRequest request, RestResponse response) {
		try {
			optionDao.delete(request, response);
			// reset
			appCachePage.clearAppPageOptionCache();
			
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
			e.printStackTrace();
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
				optionDao.item(request, response);
				request.addParam(BaseEntity.ITEM, response.getParam(BaseEntity.ITEM));
				response.getParams().remove(BaseEntity.ITEM);
			} else {
				AppPageOptionName o = new AppPageOptionName();
				o.setArchive(false);
				o.setLocked(false);
				request.addParam(BaseEntity.ITEM, o);
			}
						
			// marshall
			utilSvc.marshallFields(request, response);
									
			optionDao.save(request, response);
			// reset
			appCachePage.clearAppPageOptionCache();
						
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
}
