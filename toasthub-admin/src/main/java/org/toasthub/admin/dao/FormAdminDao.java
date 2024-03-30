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

package org.toasthub.admin.dao;

import javax.ejb.Stateless;

import org.toasthub.core.general.dao.FormDao;
import org.toasthub.core.general.model.Form;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

@FormAdminDaoQual
@Stateless
public class FormAdminDao extends FormDao implements FormAdminDaoIface {


////////////////////////////////////// Forms ////////////////////////////////////	
	
	
	@Override
	public void saveForm(RestRequest request, RestResponse response) throws Exception {
		Form form = (Form) request.getParam("form");
		entityManagerSvc.getInstance().merge(form);
	}

	@Override
	public void deleteForm(RestRequest request, RestResponse response) throws Exception {
		Form form = (Form) entityManagerSvc.getInstance().getReference(Form.class, new Long((Integer) request.getParam("formId")));
		entityManagerSvc.getInstance().remove(form);
	}


}
