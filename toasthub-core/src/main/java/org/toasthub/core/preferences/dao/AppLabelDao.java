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

import org.toasthub.core.general.model.AppPageLabelName;
import org.toasthub.core.general.model.AppPageLabelValue;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@AppLabelDaoQual
@Stateless
public class AppLabelDao implements AppLabelDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;

	public List<AppPageLabelValue> getLabels(String pageName, String lang) {
		@SuppressWarnings("unchecked")
		List<AppPageLabelValue> labels = entityManagerSvc.getInstance()
			.createQuery("SELECT NEW AppPageLabelValue(l.id, l.value, l.lang, l.rendered, l.order, l.pageLabelName.name, l.pageLabelName.className, l.pageLabelName.tabIndex,l.pageLabelName.optionalParams) FROM AppPageLabelValue l WHERE l.lang =:lang AND l.pageLabelName.pageName.name =:pageName AND l.pageLabelName.archive = false ORDER BY l.order ASC")
			.setParameter("pageName", pageName)
			.setParameter("lang", lang)
			.getResultList();
		return labels;
	}

	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<AppPageLabelName> labels = entityManagerSvc.getInstance()
				.createQuery("SELECT DISTINCT l FROM AppPageLabelName AS l JOIN FETCH l.title AS t JOIN FETCH t.langTexts AS lt JOIN FETCH l.values WHERE l.pageName.id =:pageNameId")
				.setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)))
				.getResultList();
			response.addParam("appPageLabel", labels);
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "SELECT COUNT(*) FROM AppPageLabelName AS l WHERE l.pageName.id =:pageNameId";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery).setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)));
		response.addParam(BaseEntity.ITEMCOUNT, (Long) query.getSingleResult());
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String queryStr = "SELECT l FROM AppPageLabelName AS l JOIN FETCH l.title AS t JOIN FETCH t.langTexts AS lt JOIN FETCH l.values WHERE l.id =:id";
			Query query = entityManagerSvc.getInstance().createQuery(queryStr);
			
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			AppPageLabelName appPageLabelName = (AppPageLabelName) query.getSingleResult();
		
			response.addParam(BaseEntity.ITEM, appPageLabelName);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}

}
