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

import org.toasthub.core.general.model.AppPageOptionName;
import org.toasthub.core.general.model.AppPageOptionValue;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@AppOptionDaoQual
@Stateless
public class AppOptionDao implements AppOptionDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;

	public List<AppPageOptionValue> getOptions(String pageName, String lang) {
		@SuppressWarnings("unchecked")
		List<AppPageOptionValue> options = entityManagerSvc.getInstance()
			.createQuery("SELECT NEW AppPageOptionValue(o.id, o.value, o.lang, o.rendered, o.validation, o.pageOptionName.name, o.pageOptionName.valueType, o.pageOptionName.defaultValue, o.pageOptionName.useDefault) FROM AppPageOptionValue o WHERE o.lang =:lang AND o.pageOptionName.pageName.name =:pageName AND o.pageOptionName.archive = false")
			.setParameter("pageName", pageName)
			.setParameter("lang", lang)
			.getResultList();
		return options;
	}

	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<AppPageOptionName> options = entityManagerSvc.getInstance()
				.createQuery("SELECT DISTINCT pageOption FROM AppPageOptionName AS pageOption JOIN FETCH pageOption.title AS t JOIN FETCH t.langTexts AS l JOIN FETCH pageOption.values WHERE pageOption.pageName.id =:pageNameId")
				.setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)))
				.getResultList();
			response.addParam("appPageOption", options);
		
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "SELECT COUNT(*) FROM AppPageOptionName AS pageOption WHERE pageOption.pageName.id =:pageNameId";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery).setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)));
		response.addParam(BaseEntity.ITEMCOUNT, (Long) query.getSingleResult());
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String queryStr = "SELECT po FROM AppPageOptionName AS po JOIN FETCH po.title AS t JOIN FETCH t.langTexts as l JOIN FETCH po.values WHERE po.id =:id";
			Query query = entityManagerSvc.getInstance().createQuery(queryStr);
			
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			AppPageOptionName appPageOptionName = (AppPageOptionName) query.getSingleResult();
		
			response.addParam(BaseEntity.ITEM, appPageOptionName);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
	}

}
