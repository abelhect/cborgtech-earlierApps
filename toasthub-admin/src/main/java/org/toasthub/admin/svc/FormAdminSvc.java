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

package org.toasthub.admin.svc;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.admin.dao.FormAdminDaoIface;
import org.toasthub.admin.dao.FormAdminDaoQual;
import org.toasthub.core.general.exception.PrivilegesException;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.FormSvc;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.security.svc.Authorize;

@FormAdminSvcQual
@RequestScoped
public class FormAdminSvc extends FormSvc implements ServiceProcessor, FormAdminSvcIface {

	@Inject @FormAdminDaoQual FormAdminDaoIface formDao;
	@Inject UtilSvc utilSvc;
	
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		switch (action) {
		case "INIT":
			this.getForms(request, response);
			break;
		case "LIST":
			this.getForms(request, response);
			break;
		case "SHOW":
			this.getForm(request, response);
			break;
		case "DELETE":
			this.deleteForm(request, response);
			break;
		case "SAVE":
			this.saveForm(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	@Authorize
	public void deleteForm(RestRequest request, RestResponse response){
		try {
			formDao.deleteForm(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Form Delete Successful", response);
		} catch (PrivilegesException pe){
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.SERVERERROR, pe.getMessage(), response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.EXECUTIONFAILED, "Form Delete Failed", response);
			e.printStackTrace();
		}
	}
	
	@Authorize
	public void saveForm(RestRequest request, RestResponse response){
		try {
			formDao.saveForm(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Form Save Successful", response);
		} catch (PrivilegesException pe){
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.SERVERERROR, pe.getMessage(), response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.EXECUTIONFAILED, "Form Save Failed", response);
			e.printStackTrace();
		}
	}
}
