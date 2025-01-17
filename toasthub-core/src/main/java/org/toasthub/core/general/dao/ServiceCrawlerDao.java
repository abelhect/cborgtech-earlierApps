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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ServiceClass;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@ServiceCrawlerDaoQual
@Stateless
public class ServiceCrawlerDao implements ServiceCrawlerDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;

	@Override
	public Map<String,Map<String,ServiceClass>> getServices() {
		String queryStr = "FROM ServiceClass AS sc where active = true";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		// get all services
		List<ServiceClass> services = (List<ServiceClass>) query.getResultList();
		
		Map<String,Map<String,ServiceClass>> results = new HashMap<String,Map<String,ServiceClass>>();
		
		for (ServiceClass serviceClass : services) {
			if (!results.containsKey(serviceClass.getCategory())){
				// if category does not exist create it
				results.put(serviceClass.getCategory(), new HashMap<String,ServiceClass>());
			}
			// add service to category
			results.get(serviceClass.getCategory()).put(serviceClass.getServiceKey(), serviceClass);
		}
		return results;
	}


	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT DISTINCT s FROM ServiceClass AS s ";
		
		boolean and = false;
		if (request.containsParam(BaseEntity.ACTIVE)) {
			if (!and) { queryStr += " WHERE "; }
			queryStr += "s.active =:active ";
			and = true;
		}
		
		if (request.containsParam(BaseEntity.SEARCHCOLUMN) && request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			if (!and) { queryStr += " WHERE "; }
			queryStr += "lower(s." + request.getParam(BaseEntity.SEARCHCOLUMN) + ") LIKE :searchValue"; 
			and = true;
		}
		if (request.containsParam(BaseEntity.ORDERCOLUMN)) {
			String direction = "DESC";
			if (request.containsParam(BaseEntity.ORDERDIR)) {
				direction = (String) request.getParam(BaseEntity.ORDERDIR);
			}
			queryStr += " ORDER BY "+(String) request.getParam(BaseEntity.ORDERCOLUMN)+" "+direction;
		}
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		
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
		List<ServiceClass> services = query.getResultList();

		response.addParam(BaseEntity.ITEMS, services);
		
	}


	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT COUNT(*) FROM ServiceClass AS s ";
		boolean and = false;
		if (request.containsParam(BaseEntity.ACTIVE)) {
			if (!and) { queryStr += " WHERE "; }
			queryStr += "s.active =:active ";
			and = true;
		}
		
		if (request.containsParam(BaseEntity.SEARCHVALUE) && !request.getParam(BaseEntity.SEARCHVALUE).equals("")){
			if (!and) { queryStr += " WHERE "; }
			queryStr += "s.serviceName LIKE :searchValue"; 
			and = true;
		}

		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		
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
			String queryStr = "SELECT s FROM ServiceClass AS s WHERE s.id =:id";
			Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		
			query.setParameter("id", new Long((String) request.getParam(BaseEntity.ITEMID)));
			ServiceClass serviceClass = (ServiceClass) query.getSingleResult();
			
			response.addParam(BaseEntity.ITEM, serviceClass);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}

}
