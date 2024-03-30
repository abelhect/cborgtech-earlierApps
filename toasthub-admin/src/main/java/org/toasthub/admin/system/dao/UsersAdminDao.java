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
import org.toasthub.core.system.dao.UsersDao;
import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.User;
import org.toasthub.core.system.model.UserRole;

@UsersAdminDaoQual
@Stateless
public class UsersAdminDao extends UsersDao implements UsersAdminDaoIface {
	
	@Override
	public void save(RestRequest request, RestResponse response) throws Exception {
		User user = (User) request.getParam(BaseEntity.ITEM);
		entityManagerSvc.getEntityMgrMain().merge(user);
	}
	
	@Override
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			User user = (User) entityManagerSvc.getEntityMgrMain().getReference(User.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getEntityMgrMain().remove(user);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
	}
	
	@Override
	public void disable(RestRequest request, RestResponse response) throws Exception {
		
	}

	@Override
	public void saveRole(RestRequest request, RestResponse response) throws Exception {
		// get Role
		Role role = (Role) entityManagerSvc.getEntityMgrMain().getReference(Role.class, new Long((Integer) request.getParam("roleId")));
		// get User
		User user = (User) entityManagerSvc.getEntityMgrMain().getReference(User.class, new Long((Integer) request.getParam(BaseEntity.ITEMID)));
		// save
		entityManagerSvc.getEntityMgrMain().merge(new UserRole(user,role));
		
	}

	@Override
	public void deleteRole(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT ur FROM UserRole AS ur WHERE ur.user.id =:uid AND ur.role.id =:rid";
		Query query = entityManagerSvc.getEntityMgrMain().createQuery(queryStr);
	
		query.setParameter("uid", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
		query.setParameter("rid", new Long((Integer) request.getParam("roleId")));
		UserRole userRole = (UserRole) query.getSingleResult();
		
		// remove
		entityManagerSvc.getEntityMgrMain().remove(userRole);
	}
	
	
}
