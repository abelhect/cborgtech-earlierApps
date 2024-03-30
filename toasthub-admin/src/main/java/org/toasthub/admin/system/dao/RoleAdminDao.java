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
import javax.persistence.Query;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.system.dao.RoleDao;
import org.toasthub.core.system.model.Application;
import org.toasthub.core.system.model.Permission;
import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.RolePermission;

@RoleAdminDaoQual
@Stateless
public class RoleAdminDao extends RoleDao implements RoleAdminDaoIface {


	@Override
	public void save(RestRequest request, RestResponse response) throws Exception {
		Role role = (Role) request.getParam(BaseEntity.ITEM);
		
		// get application
		if (role.getApplication() == null) {
			Application application = (Application) entityManagerSvc.getEntityMgrMain().getReference(Application.class, role.getApplicationId());
			role.setApplication(application);
		}
		
		// get permissions
		
		entityManagerSvc.getEntityMgrMain().merge(role);
	}
	
	@Override
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			Role role = (Role) entityManagerSvc.getEntityMgrMain().getReference(Role.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getEntityMgrMain().remove(role);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}
	
	@Override
	public void savePermission(RestRequest request, RestResponse response) throws Exception {
		// get Role
		Role role = (Role) entityManagerSvc.getEntityMgrMain().getReference(Role.class, new Long((Integer) request.getParam(BaseEntity.ITEMID)));
		// get Permission
		Permission permission = (Permission) entityManagerSvc.getEntityMgrMain().getReference(Permission.class, new Long((Integer) request.getParam("permissionId")));
		// save
		entityManagerSvc.getEntityMgrMain().merge(new RolePermission(role,permission));
		
		
	}

	@Override
	public void deletePermission(RestRequest request, RestResponse response) throws Exception {
		
		String queryStr = "SELECT rp FROM RolePermission AS rp WHERE rp.role.id =:rid AND rp.permission.id =:pid";
		Query query = entityManagerSvc.getEntityMgrMain().createQuery(queryStr);
	
		query.setParameter("rid", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
		query.setParameter("pid", new Long((Integer) request.getParam("permissionId")));
		RolePermission rolePermission = (RolePermission) query.getSingleResult();
		
		// remove
		entityManagerSvc.getEntityMgrMain().remove(rolePermission);
	}
}
