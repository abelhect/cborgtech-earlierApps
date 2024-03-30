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

import org.toasthub.admin.dao.WorkFlowAdminDaoIface;
import org.toasthub.admin.dao.WorkFlowAdminDaoQual;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.general.svc.WorkFlowSvc;
import org.toasthub.core.security.svc.Authorize;

@WorkFlowAdminSvcQual
@RequestScoped
public class WorkFlowAdminSvc extends WorkFlowSvc implements ServiceProcessor, WorkFlowAdminSvcIface {

	@Inject @WorkFlowAdminDaoQual WorkFlowAdminDaoIface workFlowDao;
	@Inject UtilSvc utilSvc;
	
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		// get option from main
		request.addParam("sysPageFormName", "MEMBER_WORKFLOW");
		request.addParam("sysPageLabelName", "MEMBER_WORKFLOW");
		request.addParam("sysPageTextName", "MEMBER_WORKFLOW");
				
		Long count = 0l;
		switch (action) {
		case "INIT":
			this.itemCount(request, response);
			count = (Long) response.getParam("count");
			if (count != null && count > 0){
				this.items(request, response);
			}
			break;
		case "LIST":
			this.items(request, response);
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
			workFlowDao.delete(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Authorize
	public void save(RestRequest request, RestResponse response) {
		try {
			workFlowDao.save(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
