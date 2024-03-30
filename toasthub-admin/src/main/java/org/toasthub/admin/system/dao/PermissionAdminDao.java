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

package org.toasthub.admin.system.dao;

import javax.ejb.Stateless;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.system.dao.PermissionDao;
import org.toasthub.core.system.model.Application;
import org.toasthub.core.system.model.Permission;

@PermissionAdminDaoQual
@Stateless
public class PermissionAdminDao extends PermissionDao implements PermissionAdminDaoIface {

	@Override
	public void save(RestRequest request, RestResponse response) throws Exception {
		Permission permission = (Permission) request.getParam(BaseEntity.ITEM);
		// get application
		if (permission.getApplication() == null){
			Application application = (Application) entityManagerSvc.getEntityMgrMain().getReference(Application.class, permission.getApplicationId());
			permission.setApplication(application);
		}
		entityManagerSvc.getEntityMgrMain().merge(permission);
	}
	
	@Override
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			Permission permission = (Permission) entityManagerSvc.getEntityMgrMain().getReference(Permission.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getEntityMgrMain().remove(permission);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}
}
