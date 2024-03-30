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

import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.preferences.sys.model.SysPageOptionValue;

@SysOptionDaoQual
@Stateless
public class SysOptionDao implements SysOptionDaoIface {

	@Inject EntityManagerSvc entityManagerSvc;

	public List<SysPageOptionValue> getOptions(String pageName, String lang) {
		@SuppressWarnings("unchecked")
		List<SysPageOptionValue> options = entityManagerSvc.getEntityMgrMain()
			.createQuery("FROM SysPageOptionValue o WHERE o.lang =:lang AND o.pageOptionName.pageName.name =:pageName")
			.setParameter("pageName", pageName)
			.setParameter("lang", lang)
			.getResultList();
		return options;
	}

}
