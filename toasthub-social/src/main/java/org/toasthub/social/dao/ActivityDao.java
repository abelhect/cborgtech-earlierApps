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
import org.toasthub.core.system.model.User;
import org.toasthub.social.model.Activity;
import org.toasthub.social.model.Message;


@Stateless
public class ActivityDao {

	@Inject UserContext login;
	@Inject EntityManagerSvc entityManagerSvc;

	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "SELECT count(*) FROM Activity AS a WHERE a.owner.id <> :uid";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid",login.getCurrentUser().getId());
		response.addParam("count", (Long) query.getSingleResult());
	}
	
	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		String HQLQuery = "FROM Activity a WHERE a.user.id = :uid ORDER BY a.created DESC";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid", login.getCurrentUser().getId());
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("items", (List<?>) query.getResultList());
	}
	
	public void item(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM Activity WHERE id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id", new Long((Integer) request.getParam("id")));
		response.addParam("item", (Message) query.getSingleResult());
	}

	public void save(RestRequest request, RestResponse response) throws Exception {
		Activity activity = (Activity) request.getParam("activity");
		if (activity == null) {
			User user = (User) entityManagerSvc.getEntityMgrMain().createQuery("FROM User WHERE id = :id")
					.setParameter("id",login.getCurrentUser().getId()).getSingleResult();
			activity = new Activity((String) request.getParam("message"),login.getCurrentUser().getId());
		}
		entityManagerSvc.getInstance().merge(activity);
	}
	
	public void delete(RestRequest request, RestResponse response) throws Exception {
		Activity activity = (Activity) entityManagerSvc.getInstance().getReference(Activity.class, new Long((Integer) request.getParam("id")));
		entityManagerSvc.getInstance().remove(activity);
	}
}
