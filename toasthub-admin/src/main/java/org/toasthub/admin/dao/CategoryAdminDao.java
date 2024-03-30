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
import javax.persistence.EntityManager;

import org.toasthub.core.general.dao.CategoryDao;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Category;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.security.svc.Authorize;

@CategoryAdminDaoQual
@Stateless
public class CategoryAdminDao extends CategoryDao implements CategoryAdminDaoIface {
	
	@Authorize
	public void save(RestRequest request, RestResponse response) throws Exception {
		Category category = (Category) request.getParam("category");
		EntityManager emain = entityManagerSvc.getEntityMgrMain();

		emain.merge(category);
	}
	
	@Authorize
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			Category category = (Category) entityManagerSvc.getInstance().getReference(Category.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getInstance().remove(category);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
	}
}
