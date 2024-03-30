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

import org.toasthub.admin.preferences.dao.SysFormFieldAdminDaoIface;
import org.toasthub.admin.preferences.dao.SysFormFieldAdminDaoQual;
import org.toasthub.admin.preferences.dao.SysLabelAdminDaoIface;
import org.toasthub.admin.preferences.dao.SysLabelAdminDaoQual;
import org.toasthub.admin.preferences.dao.SysOptionAdminDaoIface;
import org.toasthub.admin.preferences.dao.SysOptionAdminDaoQual;
import org.toasthub.admin.preferences.dao.SysPageAdminDaoIface;
import org.toasthub.admin.preferences.dao.SysPageAdminDaoQual;
import org.toasthub.admin.preferences.dao.SysTextAdminDaoIface;
import org.toasthub.admin.preferences.dao.SysTextAdminDaoQual;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.preferences.svc.SysPageSvc;
import org.toasthub.core.security.svc.Authorize;

@SysPageAdminSvcQual
@RequestScoped
public class SysPageAdminSvc extends SysPageSvc implements ServiceProcessor, SysPageAdminSvcIface {

	@Inject @SysPageAdminDaoQual SysPageAdminDaoIface pageDao;
	@Inject @SysFormFieldAdminDaoQual SysFormFieldAdminDaoIface formFieldDao;
	@Inject @SysLabelAdminDaoQual SysLabelAdminDaoIface labelDao;
	@Inject @SysTextAdminDaoQual SysTextAdminDaoIface textDao;
	@Inject @SysOptionAdminDaoQual SysOptionAdminDaoIface optionDao;
	
	public void process(RestRequest request, RestResponse response) {
		
		
	}

	@Authorize
	public void save(RestRequest request, RestResponse response) throws Exception {
		
	}

}
