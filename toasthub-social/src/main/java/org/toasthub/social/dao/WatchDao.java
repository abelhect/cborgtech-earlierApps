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
import org.toasthub.core.general.model.UserRef;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.social.model.WatchGroup;
import org.toasthub.social.model.WatchGroupJoin;

@Stateless
public class WatchDao {

	@Inject UserContext login;
	@Inject UtilSvc utilSvc;
	@Inject EntityManagerSvc entityManagerSvc;

	public void getWatchGroups(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM WatchGroup as wg WHERE wg.owner.id = :uid ";
		HQLQuery += "ORDER BY wg.description ASC";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid", login.getCurrentUser().getId());
		if ((Integer)request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer)request.getParam("pageStart"));
			query.setMaxResults((Integer)request.getParam("pageLimit"));
		}
		
		List<WatchGroup> results = query.getResultList();
		response.addParam("watchGroups", results);
	}
	
	public void getWatchGroup(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		if (request.getParams().containsKey("watchGroupId")){
			String HQLQuery = "FROM WatchGroup as wg WHERE wg.id = :id AND wg.owner.id = :uid ";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			Long a = (Long) request.getParam("watchGroupId");
			query.setParameter("id", a);
			query.setParameter("uid", login.getCurrentUser().getId());
		} else {
			String HQLQuery = "FROM WatchGroup as wg WHERE wg.name = :name AND wg.owner.id = :uid ";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("name", "Default");
			query.setParameter("uid", login.getCurrentUser().getId());
		}
		
		WatchGroup result = (WatchGroup) query.getSingleResult();
		response.addParam("watchGroup", result);
		if (request.getParam("watchGroupId") == null){
			request.addParam("watchGroupId", result.getId());
		}
	}

	public void saveWatchGroup(RestRequest request, RestResponse response) throws Exception {
		WatchGroup wg = (WatchGroup) request.getParam("watchGroup");
		wg.setOwnerRefId(login.getCurrentUser().getId());
		entityManagerSvc.getInstance().persist(wg);
		response.addParam("watchGroup", wg);
	}
	
	public void getWatchGroupCount(RestRequest request, RestResponse response) throws Exception {
		Long count = (Long) entityManagerSvc.getInstance().createQuery("SELECT count(*) FROM WatchGroup as g WHERE g.owner.id = :uid")
				.setParameter("uid", login.getCurrentUser().getId()).getSingleResult();
		response.addParam("watchGroupCount", count);
	}
	
	public void deleteWatchGroup(RestRequest request, RestResponse response) throws Exception {
		entityManagerSvc.getInstance().createQuery("DELETE WatchGroup as g WHERE g.owner.id = :myid AND g.name = :name")
		.setParameter("myid",login.getCurrentUser().getId())
		.setParameter("name", request.getParam("groupWatchName")).executeUpdate();
		
	}
	
	
	public void getWatchGroupMembers(RestRequest request, RestResponse response) throws Exception {
		if (request.getParam("watchGroupId") != null) {
			String HQLQuery = "SELECT wgj.user FROM WatchGroupJoin AS wgj WHERE wgj.user.active = true AND wgj.user.archive = false AND wgj.user.locked = false AND wgj.watchGroup.id = :id ";
			HQLQuery += "ORDER BY wgj.user.lastname ASC";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("id", (Long) request.getParam("watchGroupId"));
			if ((Integer)request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer)request.getParam("pageStart"));
				query.setMaxResults((Integer)request.getParam("pageLimit"));
			}
			List<UserRef> members = query.getResultList();
			response.addParam("members", members);
		} else {
			utilSvc.addStatus(RestResponse.INFO, RestResponse.MISSINGPARAM, "WatchGroupId is missing", response);
		}
	}
	
	public void getWatchGroupMemberCount(RestRequest request, RestResponse response) throws Exception {
		if (request.getParam("watchGroupId") != null){
			Long a = (Long) request.getParam("watchGroupId");
			Long count = (Long) entityManagerSvc.getInstance().createQuery("SELECT count(*) FROM WatchGroupJoin as g WHERE g.watchGroup.id = :id")
				.setParameter("id", a).getSingleResult();
			response.addParam("watchGroupMemberCount", count);
		} else {
			utilSvc.addStatus(RestResponse.INFO, RestResponse.MISSINGPARAM, "WatchGroupId is missing", response);
		}
	}
	
	public void saveWatchGroupMember(RestRequest request, RestResponse response) throws Exception {
		Long a = (Long) request.getParam("watchGroupId");
		Long b = (Long) request.getParam("aquaintanceId");
		WatchGroup wg = (WatchGroup) entityManagerSvc.getInstance().getReference(WatchGroup.class, a);
		WatchGroupJoin wgj = new WatchGroupJoin(b,wg);
		entityManagerSvc.getInstance().persist(wgj);
	}
	
	public void deleteWatchGroupMember(RestRequest request, RestResponse response) throws Exception {
		entityManagerSvc.getInstance().createQuery("DELETE  as a WHERE a.user.id = :myid and a.acquaintance.id = :memberid")
		.setParameter("myid",login.getCurrentUser().getId())
		.setParameter("memberid", (Long) request.getParam("memberId")).executeUpdate();
		entityManagerSvc.getInstance().createQuery("DELETE Acquaintance as a WHERE a.user.id = :memberid and a.acquaintance.id = :myid")
		.setParameter("myid",login.getCurrentUser().getId())
		.setParameter("memberid", (Long) request.getParam("memberId")).executeUpdate();
	}

}
