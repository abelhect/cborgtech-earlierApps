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

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.security.svc.Authorize;
import org.toasthub.social.dao.MessageDao;

@RequestScoped
public class MessageSvc implements ServiceProcessor {
	
	@Inject MessageDao messageDao;
	@Inject UtilSvc utilSvc;
	
	public void process(RestRequest request, RestResponse response) {
		
		String action = (String) request.getParam("action");
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
			save(request, response);
			break;
		case "DELETE":
			delete(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	public void itemCount(RestRequest request, RestResponse response) {
		try {
			messageDao.itemCount(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
	
	public void items(RestRequest request, RestResponse response) {
		try {
			messageDao.items(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
	
	public void item(RestRequest request, RestResponse response) {
		try {
			messageDao.item(request, response);
			//utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
	
	@Authorize
	public void save(RestRequest request, RestResponse response){
		try {
			messageDao.save(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	}
	
	@Authorize
	public void delete(RestRequest request, RestResponse response){
		try {
			messageDao.delete(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
			e.printStackTrace();
		}
	}
}
