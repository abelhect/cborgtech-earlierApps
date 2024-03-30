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

package org.toasthub.admin.system.dao;

import javax.ejb.Stateless;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.system.dao.ClientDomainDao;
import org.toasthub.core.system.model.ClientDomain;

@ClientDomainAdminDaoQual
@Stateless
public class ClientDomainAdminDao extends ClientDomainDao implements ClientDomainAdminDaoIface {

	@Override
	public void save(RestRequest request, RestResponse response) throws Exception {
		ClientDomain clientDomain = (ClientDomain) request.getParam(BaseEntity.ITEM);
		entityManagerSvc.getEntityMgrMain().merge(clientDomain);
	}
	
	@Override
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			
			ClientDomain clientDomain = (ClientDomain) entityManagerSvc.getEntityMgrMain().getReference(ClientDomain.class,  new Long((Integer) request.getParam(BaseEntity.ITEMID)));
			entityManagerSvc.getEntityMgrMain().remove(clientDomain);
			
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}
}
