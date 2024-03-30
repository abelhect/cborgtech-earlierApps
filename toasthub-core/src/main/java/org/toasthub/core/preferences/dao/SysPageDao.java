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

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.preferences.sys.model.SysPageName;

@SysPageDaoQual
@Stateless
public class SysPageDao implements SysPageDaoIface {

	@Inject EntityManagerSvc entityManagerSvc;
	
	public SysPageName getPageName(Long id) {
		SysPageName pageName = (SysPageName) entityManagerSvc.getEntityMgrMain()
			.createQuery("from SysPageName where id = :id")
			.setParameter("id",id)
			.getSingleResult();
		return pageName;
	}

	public SysPageName getPageName(String name) {
		SysPageName pageName = (SysPageName) entityManagerSvc.getEntityMgrMain()
			.createQuery("from SysPageName where name = :name")
			.setParameter("name",name)
			.getSingleResult();
		return pageName;
	}

}
