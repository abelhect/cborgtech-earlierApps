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
import org.toasthub.core.general.dao.MenuDao;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Menu;
import org.toasthub.core.general.model.MenuItem;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.security.svc.Authorize;

@MenuAdminDaoQual
@Stateless
public class MenuAdminDao extends MenuDao implements MenuAdminDaoIface {
	
	@Authorize
	public void save(RestRequest request, RestResponse response) throws Exception {
		if ("subItem".equals(request.getParam(BaseEntity.ITEMTYPE))) {
			// menu reference
			MenuItem menuItem = (MenuItem) request.getParam(BaseEntity.ITEM);
			if (menuItem.getMenu() == null) {
				Menu menu = (Menu) entityManagerSvc.getInstance().getReference(Menu.class, new Long((Integer) request.getParam(BaseEntity.PARENTID)));
				menuItem.setMenu(menu);
			}
			entityManagerSvc.getInstance().merge(menuItem);
		} else if ("subSub".equals(request.getParam(BaseEntity.ITEMTYPE))) {
			MenuItem menuItem = (MenuItem) request.getParam(BaseEntity.ITEM);
			if (menuItem.getParent() == null) {
				MenuItem p = (MenuItem) entityManagerSvc.getInstance().getReference(MenuItem.class, new Long((Integer) request.getParam(BaseEntity.PARENTID)));
				menuItem.setParent(p);
				menuItem.setMenu(p.getMenu());
			}
			entityManagerSvc.getInstance().merge(menuItem);
		} else {
			Menu menu = (Menu) request.getParam(BaseEntity.ITEM);
			entityManagerSvc.getInstance().merge(menu);
		}
	}

	@Authorize
	public void delete(RestRequest request, RestResponse response) throws Exception {
		if (request.containsParam(BaseEntity.ITEMID) && !"".equals(request.getParam(BaseEntity.ITEMID))) {
			if (request.containsParam(BaseEntity.ITEMTYPE) && "subItem".equals(request.getParam(BaseEntity.ITEMTYPE)) ) {
				MenuItem menuItem = (MenuItem) entityManagerSvc.getInstance().getReference(MenuItem.class, new Long((Integer) request.getParam(BaseEntity.ITEMID)));
				entityManagerSvc.getInstance().remove(menuItem);
			} else {
				Menu menu = (Menu) entityManagerSvc.getInstance().getReference(Menu.class, new Long((Integer) request.getParam(BaseEntity.ITEMID)));
				entityManagerSvc.getInstance().remove(menu);
			}
		} else {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing ID", response);
		}
		
	}
}
