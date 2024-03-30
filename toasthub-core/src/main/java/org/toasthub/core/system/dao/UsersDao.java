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

package org.toasthub.core.system.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.security.svc.Authorize;
import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.User;

@UsersDaoQual
@Stateless
public class UsersDao implements UsersDaoIface {
	
	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;
	
	public void saveUser(RestRequest request, RestResponse response) throws Exception {
		User user = (User) request.getParam("sysUser");
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		Set<Role> roles = new HashSet<Role>();
		roles.add((Role) emain.createQuery("FROM Role r WHERE r.code = :code").setParameter("code","ROLE_MEMBER").getSingleResult());
		user.setRoles(roles);
		emain.merge(user);
	}
	
	public void resetPassword(String username, String password, String salt, String sessionToken) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		int results = emain.createQuery("update User set password = :password, salt = :salt, sessionToken = :sessionToken, forceChange = :forceChange where username = :username")
				.setParameter("password",password).setParameter("salt", salt)
				.setParameter("sessionToken",sessionToken)
				.setParameter("forceChange", true)
				.setParameter("username",username)
				.executeUpdate();
		if (results == 0) {
			// throw error
			throw new Exception("Password reset Failed!");
		}
	}
	
	public void changePassword(String username, String password, String salt, String sessionToken) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		int results = emain.createQuery("update User set password = :password, salt = :salt, sessionToken = :sessionToken, forceChange = :forceChange where username = :username")
				.setParameter("password",password)
				.setParameter("salt",salt)
				.setParameter("sessionToken",sessionToken)
				.setParameter("forceChange", false)
				.setParameter("username",username)
				.executeUpdate();
		if (results == 0) {
			// throw error
			throw new Exception("Password change Failed!");
		}
	}
	
	public User findUser(String username) throws Exception {
		User user = null;
		try {
		user = (User) entityManagerSvc.getEntityMgrMain()
			.createQuery("FROM User as u WHERE u.username = :username AND u.archive = :archive")
			.setParameter("username", username)
			.setParameter("archive",false)
			.getSingleResult();
		} catch (NoResultException noresut){
			
		}
		return user;
	}
	
	public User findUserByEmail(String email) throws Exception {
		User user = null;
		try {
		user = (User) entityManagerSvc.getEntityMgrMain()
			.createQuery("FROM User as u WHERE u.email = :email AND u.archive = :archive")
			.setParameter("email", email)
			.setParameter("archive",false)
			.getSingleResult();
		} catch (NoResultException noresut){
			
		}
		return user;
	}
	
	@Authorize
	public void updateUser(RestRequest request, RestResponse response) throws Exception {
		User User = (User) request.getParam(BaseEntity.ITEM);
		entityManagerSvc.getEntityMgrMain().merge(User);
	}
	
	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		
		String queryStr = "SELECT DISTINCT u FROM User AS u ";
		
		boolean and = false;
		if (request.containsParam(BaseEntity.ACTIVE)) {
			if (!and) { queryStr += " WHERE "; }
			queryStr += "u.active =:active ";
			and = true;
		}
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			if (!and) { queryStr += " WHERE "; } else { queryStr += " AND "; }
			queryStr += " u.firstname LIKE :searchValue OR u.lastname LIKE :searchValue "; 
			and = true;
		}
		
		Query query = entityManagerSvc.getEntityMgrMain().createQuery(queryStr);
		
		if (request.containsParam(BaseEntity.ACTIVE)) {
			query.setParameter("active", (Boolean) request.getParam(BaseEntity.ACTIVE));
		} 
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE)).toLowerCase()+"%");
		}
		if (request.containsParam(BaseEntity.PAGELIMIT) && (Integer) request.getParam(BaseEntity.PAGELIMIT) != 0){
			query.setFirstResult((Integer) request.getParam(BaseEntity.PAGESTART));
			query.setMaxResults((Integer) request.getParam(BaseEntity.PAGELIMIT));
		}
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();

		response.addParam(BaseEntity.ITEMS, users);
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT COUNT(*) FROM User AS u ";
		boolean and = false;
		if (request.containsParam(BaseEntity.ACTIVE)) {
			if (!and) { queryStr += " WHERE "; }
			queryStr += "u.active =:active ";
			and = true;
		}
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			if (!and) { queryStr += " WHERE "; } else { queryStr += " AND "; }
			queryStr += " u.firstname LIKE :searchValue OR u.lastname LIKE :searchValue "; 
			and = true;
		}

		Query query = entityManagerSvc.getEntityMgrMain().createQuery(queryStr);
		
		if (request.containsParam(BaseEntity.ACTIVE)) {
			query.setParameter("active", (Boolean) request.getParam(BaseEntity.ACTIVE));
		} 
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE)).toLowerCase()+"%");
		}
		
		Long count = (Long) query.getSingleResult();
		if (count == null){
			count = 0l;
		}
		response.addParam(BaseEntity.ITEMCOUNT, count);
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String queryStr = "SELECT u FROM User AS u WHERE u.id =:id";
			Query query = entityManagerSvc.getEntityMgrMain().createQuery(queryStr);
		
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			User user = (User) query.getSingleResult();
			
			response.addParam(BaseEntity.ITEM, user);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
	}
}
