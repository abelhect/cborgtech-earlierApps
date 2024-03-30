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

package org.toasthub.core.general.dao;

import java.util.HashSet;
import java.util.Set;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.toasthub.core.general.model.AppCacheClientDomains;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.utils.SessionHolder;
import org.toasthub.core.security.model.LoginLog;
import org.toasthub.core.system.model.ClientDomain;
import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.User;

@Stateless
public class UserManagerDao {
	
	@Inject EntityManagerSvc entityManagerSvc;
	@Inject	AppCacheClientDomains appCacheClientDomains;
	
	public User findUser(String username) throws Exception {
		User user = null;
		try {
		user = (User) entityManagerSvc.getEntityMgrMain()
			.createQuery("FROM User as u join fetch u.roles as roles WHERE u.username = :username AND u.archive = :archive")
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
			.createQuery("FROM User as u join fetch u.roles as roles WHERE u.email = :email AND u.archive = :archive")
			.setParameter("email", email)
			.setParameter("archive",false)
			.getSingleResult();
		} catch (NoResultException noresut){
			
		}
		return user;
	}
	/*
	public AppUser findAppUser(String username) throws Exception {
		AppUser appUser = null;
		try {
		appUser = (AppUser) entityManagerSvc.getInstance()
				.createQuery("FROM AppUser as u join fetch u.roles as roles WHERE u.username = :username AND u.archive = :archive")
				.setParameter("username", username).setParameter("archive",false)
				.getSingleResult();
		} catch (NoResultException noresut){
			
		}
		return appUser;
	}

	public void saveAppUser(AppUser appUser) throws Exception {
		EntityManager em = entityManagerSvc.getInstance();
		String host = SessionHolder.getURLDomain();
		ClientDomain cdomain = appCacheClientDomains.getClientDomains().get(host);
	
		if (appUser.getRoles() == null){
			Set<AppRole> roles = new HashSet<AppRole>();
			roles.add((AppRole) em.createQuery("FROM AppRole r WHERE r.roleName = :name AND r.domain = :domain").setParameter("name","user").setParameter("domain","member").getSingleResult());
			appUser.setRoles(roles);
		}
		em.merge(appUser);
	}
	*/
	public void saveUser(User user) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		Set<Role> roles = new HashSet<Role>();
		roles.add((Role) emain.createQuery("FROM Role r WHERE r.code = :code").setParameter("code","ROLE_MEMBER").getSingleResult());
		user.setRoles(roles);
		emain.merge(user);
	}

	public void resetPassword(String username, String password, String salt, String sessionToken) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		int results = emain.createQuery("update User set password = :password, salt = :salt, sessionToken = :sessionToken, forceReset = :forceReset where username = :username")
				.setParameter("password",password).setParameter("salt", salt).setParameter("sessionToken",sessionToken).setParameter("forceReset", true).setParameter("username",username).executeUpdate();
		if (results == 0) {
			// throw error
			throw new Exception("Password reset Failed!");
		}
	}
	
	public void changePassword(String username, String password, String salt, String sessionToken) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		int results = emain.createQuery("update User set password = :password, salt = :salt, sessionToken = :sessionToken, forceReset = :forceReset where username = :username")
				.setParameter("password",password).setParameter("salt",salt).setParameter("sessionToken",sessionToken).setParameter("forceReset", false).setParameter("username",username).executeUpdate();
		if (results == 0) {
			// throw error
			throw new Exception("Password change Failed!");
		}
	}
	
	public void updateEmailConfirm(User user) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		emain.createQuery("update User set emailConfirm = :emailConfirm where id = :id").setParameter("emailConfirm",true).setParameter("id",user.getId()).executeUpdate();
	}
	
	public void logAccess(LoginLog loginLog) throws Exception {
		EntityManager emain = entityManagerSvc.getEntityMgrMain();
		String host = SessionHolder.getURLDomain();
		ClientDomain cdomain = appCacheClientDomains.getClientDomains().get(host);
		loginLog.setAppname(cdomain.getAPPName());
		emain.persist(loginLog);
	}
	
}
