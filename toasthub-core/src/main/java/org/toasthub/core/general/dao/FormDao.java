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

import java.util.Arrays;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.Form;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;

@FormDaoQual
@Stateless
@SuppressWarnings("unchecked")
public class FormDao implements FormDaoIface {

	@Inject 
	protected UserContext login;
	@Inject 
	protected EntityManagerSvc entityManagerSvc;

////////////////////////////////////// Forms ////////////////////////////////////	
	
	public List<Form> getForms(RestRequest request, RestResponse response) {
		String HQLQuery = "SELECT f FROM Form AS f WHERE g.owner.id <> :uid AND g.access IN(:access) AND g.id NOT IN(SELECT j.group.id FROM GroupJoin AS j WHERE j.user.id = :jid) AND g.id NOT IN(SELECT r.group.id FROM GroupPublicRequest AS r where r.sender.id = :uid) ORDER BY g.name ASC";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			query.setParameter("jid", login.getCurrentUser().getId());
			List<String> pubAccess = Arrays.asList("PUBO","PUBR");
			query.setParameter("access",pubAccess);
		
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		List<?> forms = query.getResultList();
		return (List<Form>) forms;
	}
	
	public void getFormCount(RestRequest request, RestResponse response) {
		Query query = null;
		String HQLQuery = "SELECT count(*) FROM Form AS f WHERE f.owner.id = :uid";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid",login.getCurrentUser().getId());
		response.addParam("count", (Long) query.getSingleResult());
	}
	
	public Form getForm(RestRequest request, RestResponse response){
		String HQLQuery = "FROM Form AS f WHERE f.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("formId")));
		return (Form) query.getSingleResult();
	}
	

}
