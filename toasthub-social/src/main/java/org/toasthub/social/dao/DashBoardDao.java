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

package org.toasthub.social.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.social.model.AvailablePortal;
import org.toasthub.social.model.Portal;

@Stateless
public class DashBoardDao {

	@Inject UserContext login;
	@Inject EntityManagerSvc entityManagerSvc;
	
	public void getPortals(RestRequest request, RestResponse response) {
		String queryStr = "FROM Portal p WHERE p.user.id = :uid ORDER BY p.sortOrder ASC";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("uid", login.getCurrentUser().getId());
		response.addParam("portals", (List<?>) query.getResultList());
	}

	public void addPortal(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "FROM AvailablePortal WHERE id = :portalid";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("portalid", new Long((Integer) request.getParam("availablePortalId")));
		AvailablePortal availablePortal = (AvailablePortal) query.getSingleResult();
	
		Portal portal = new Portal(availablePortal.getName(),login.getCurrentUser().getId());
		entityManagerSvc.getInstance().merge(portal);
		
	}

	public void getAvailablePortals(RestRequest request, RestResponse response) {
		String queryStr = "SELECT NEW AvailablePortal(ap.id, ap.name) FROM AvailablePortal ap WHERE ap.active = :active AND ap.name NOT IN (SELECT p.name FROM Portal p WHERE p.user.id = :uid) ORDER BY ap.name ASC";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("active", true);
		query.setParameter("uid",login.getCurrentUser().getId());
		response.addParam("availablePortals", (List<?>) query.getResultList());
	}

	public void addAllPortals(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "FROM AvailablePortal ap WHERE ap.name NOT IN (SELECT p.name FROM Portal p WHERE p.user.id = :uid)";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("uid",login.getCurrentUser().getId());
		List<AvailablePortal> availablePortals = query.getResultList();
		
		for (AvailablePortal ap : availablePortals){
			Portal portal = new Portal(ap.getName(),login.getCurrentUser().getId());
			entityManagerSvc.getInstance().merge(portal);
		}
	}

}
