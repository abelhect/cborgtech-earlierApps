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

package org.toasthub.admin.dao;

import javax.ejb.Stateless;

import org.toasthub.core.general.dao.LanguageDao;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Language;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

@LanguageAdminDaoQual
@Stateless
public class LanguageAdminDao extends LanguageDao implements LanguageAdminDaoIface {
	
	@Override
	public void save(RestRequest request, RestResponse response) throws Exception {
		Language language = (Language) request.getParam(BaseEntity.ITEM);
		entityManagerSvc.getInstance().merge(language);
	}

	@Override
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			Language language = (Language) entityManagerSvc.getInstance().getReference(Language.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getInstance().remove(language);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}

}