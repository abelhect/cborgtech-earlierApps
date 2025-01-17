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

package org.toasthub.core.preferences.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.AppPageName;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@AppPageDaoQual
@Stateless
public class AppPageDao implements AppPageDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;
	
	public AppPageName getPageName(Long id) {
		AppPageName pagename = (AppPageName) entityManagerSvc.getInstance()
			.createQuery("FROM AppPageName where id = :id")
			.setParameter("id",id)
			.getSingleResult();
		return pagename;
	}

	public AppPageName getPageName(String name) {
		AppPageName pagename = (AppPageName) entityManagerSvc.getInstance()
			.createQuery("FROM AppPageName where name = :name")
			.setParameter("name",name)
			.getSingleResult();
		return pagename;
	}

	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT p FROM AppPageName AS p JOIN FETCH p.title AS t JOIN FETCH t.langTexts AS l WHERE p.category =:category AND p.active =:active";
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			queryStr += " AND l.lang =:lang AND l.text LIKE :searchValue"; 
		}
		
		queryStr += " ORDER BY p.name ASC";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr).setParameter("category", (String) request.getParam("category"));
	
		if (request.containsParam(BaseEntity.ACTIVE)) {
			query.setParameter("active", (Boolean) request.getParam(BaseEntity.ACTIVE));
		} else {
			query.setParameter("active", true);
		}
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE)).toLowerCase()+"%");
			query.setParameter("lang",request.getParam(BaseEntity.LANG));
		}
		
		if (request.containsParam(BaseEntity.PAGELIMIT) && (Integer) request.getParam(BaseEntity.PAGELIMIT) != 0){
			query.setFirstResult((Integer) request.getParam(BaseEntity.PAGESTART));
			query.setMaxResults((Integer) request.getParam(BaseEntity.PAGELIMIT));
		}
		
		List<?> results = query.getResultList();
		
		response.addParam(BaseEntity.ITEMS, (List<AppPageName>) results);
		
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String queryStr = "SELECT COUNT(*) FROM AppPageName AS p JOIN p.title AS t JOIN t.langTexts AS l WHERE p.active = true AND category =:category AND p.active =:active";
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			queryStr += " AND l.lang =:lang AND l.text LIKE :searchValue"; 
		}
		query = entityManagerSvc.getInstance().createQuery(queryStr).setParameter("category", (String) request.getParam("category"));
		
		if (request.containsParam(BaseEntity.ACTIVE)) {
			query.setParameter("active", (Boolean) request.getParam(BaseEntity.ACTIVE));
		} else {
			query.setParameter("active", true);
		}
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE)).toLowerCase()+"%");
			query.setParameter("lang",request.getParam(BaseEntity.LANG));
		}
		
		response.addParam(BaseEntity.ITEMCOUNT, (Long) query.getSingleResult());
	
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String HQLQuery = "SELECT p FROM AppPageName AS p JOIN FETCH p.title AS t JOIN FETCH t.langTexts WHERE p.id = :id ";
			
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)) );
			response.addParam(BaseEntity.ITEM, query.getSingleResult());
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
		
		
	}

}
