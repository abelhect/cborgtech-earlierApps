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

import org.toasthub.core.general.model.AppPageTextName;
import org.toasthub.core.general.model.AppPageTextValue;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@AppTextDaoQual
@Stateless
public class AppTextDao implements AppTextDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;

	public List<AppPageTextValue> getTexts(String pageName, String lang) {
		@SuppressWarnings("unchecked")
		List<AppPageTextValue> texts = entityManagerSvc.getInstance()
			.createQuery("SELECT NEW AppPageTextValue(t.id, t.value, t.lang, t.rendered, t.pageTextName.name) FROM AppPageTextValue t WHERE t.lang =:lang AND t.pageTextName.pageName.name =:pageName AND t.pageTextName.archive = false")
			.setParameter("pageName", pageName)
			.setParameter("lang", lang)
			.getResultList();
		return texts;
	}

	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<AppPageTextName> texts = entityManagerSvc.getInstance()
				.createQuery("SELECT DISTINCT pageText FROM AppPageTextName AS pageText JOIN FETCH pageText.title AS t JOIN FETCH t.langTexts AS l JOIN FETCH pageText.values WHERE pageText.pageName.id =:pageNameId")
				.setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)))
				.getResultList();
			response.addParam("appPageText", texts);
		
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "SELECT COUNT(*) FROM AppPageTextName AS pageText WHERE pageText.pageName.id =:pageNameId";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery).setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)));
		response.addParam(BaseEntity.ITEMCOUNT, (Long) query.getSingleResult());
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String queryStr = "SELECT pt FROM AppPageTextName AS pt JOIN FETCH pt.title AS t JOIN FETCH t.langTexts as l JOIN FETCH pt.values WHERE pt.id =:id";
			Query query = entityManagerSvc.getInstance().createQuery(queryStr);
			
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			AppPageTextName appPageTextName = (AppPageTextName) query.getSingleResult();
		
			response.addParam(BaseEntity.ITEM, appPageTextName);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}

}
