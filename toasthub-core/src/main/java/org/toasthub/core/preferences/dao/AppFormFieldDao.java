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

import org.toasthub.core.general.model.AppPageFormFieldName;
import org.toasthub.core.general.model.AppPageFormFieldValue;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

@AppFormFieldDaoQual
@Stateless
public class AppFormFieldDao implements AppFormFieldDaoIface {

	@Inject 
	protected EntityManagerSvc entityManagerSvc;
	@Inject
	protected UtilSvc utilSvc;
	
	public List<AppPageFormFieldValue> getFormFields(String pageName, String lang) {
		@SuppressWarnings("unchecked")
		List<AppPageFormFieldValue> formFields = entityManagerSvc.getInstance()
			.createQuery("SELECT NEW AppPageFormFieldValue(f.id, f.value, f.label, f.lang, f.rendered, f.required, f.order, f.validation, f.image, f.pageFormFieldName.name, f.pageFormFieldName.fieldType, f.pageFormFieldName.htmlType, f.pageFormFieldName.className, f.pageFormFieldName.group, f.pageFormFieldName.subGroup, f.pageFormFieldName.tabIndex, f.pageFormFieldName.optionalParams, f.pageFormFieldName.classModel) FROM AppPageFormFieldValue f WHERE f.lang =:lang AND f.pageFormFieldName.pageName.name =:pageName AND f.pageFormFieldName.archive = false ORDER BY f.pageFormFieldName.group ASC, f.order ASC")
			.setParameter("pageName", pageName)
			.setParameter("lang", lang)
			.getResultList();
		return formFields;
	}

	@Override
	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		List<AppPageFormFieldName> formFields = entityManagerSvc.getInstance()
				.createQuery("SELECT DISTINCT f FROM AppPageFormFieldName AS f JOIN FETCH f.title AS t JOIN FETCH t.langTexts AS l JOIN FETCH f.values WHERE f.pageName.id =:pageNameId")
				.setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)))
				.getResultList();
			response.addParam("appPageFormField", formFields);
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "SELECT COUNT(*) FROM AppPageFormFieldName AS f WHERE f.pageName.id =:pageNameId";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery).setParameter("pageNameId", new Long((Integer)request.getParam(BaseEntity.PARENTID)));
		response.addParam(BaseEntity.ITEMCOUNT, (Long) query.getSingleResult());
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			String queryStr = "SELECT f FROM AppPageFormFieldName AS f JOIN FETCH f.title AS t JOIN FETCH t.langTexts as l JOIN FETCH f.values WHERE f.id =:id";
			Query query = entityManagerSvc.getInstance().createQuery(queryStr);
			
			query.setParameter("id", new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			AppPageFormFieldName appPageFormFieldName = (AppPageFormFieldName) query.getSingleResult();
		
			response.addParam(BaseEntity.ITEM, appPageFormFieldName);
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
	}

}
