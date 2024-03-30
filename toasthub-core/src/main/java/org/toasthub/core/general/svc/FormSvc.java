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

import org.toasthub.core.general.dao.FormDaoIface;
import org.toasthub.core.general.dao.FormDaoQual;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Form;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;

@FormSvcQual
@RequestScoped
public class FormSvc implements ServiceProcessor, FormSvcIface {

	@Inject @FormDaoQual FormDaoIface formDao;
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
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	
	public void getForm(RestRequest request, RestResponse response) {
		Form formMeta = null;
		response.addParam("formMeta",formMeta);
	}

	public void getForms(RestRequest request, RestResponse response){
		formDao.getForms(request, response);
	}
	
	public void getFormCount(RestRequest request, RestResponse response){
		formDao.getFormCount(request, response);
	}
	
}
