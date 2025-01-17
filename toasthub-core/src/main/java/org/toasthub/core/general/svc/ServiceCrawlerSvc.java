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

package org.toasthub.core.general.svc;

import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.dao.ServiceCrawlerDaoIface;
import org.toasthub.core.general.dao.ServiceCrawlerDaoQual;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ServiceClass;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;

@ServiceCrawlerSvcQual
@RequestScoped
public class ServiceCrawlerSvc implements ServiceProcessor, ServiceCrawlerSvcIface {

	@Inject
	@ServiceCrawlerDaoQual
	ServiceCrawlerDaoIface serviceCrawlerDao;
	
	@Inject 
	UtilSvc utilSvc;
	
	@Override
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		Long count = 0l;
		switch (action) {
		case "LIST":
			
			break;
		case "SHOW":
			
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
	
	// get services
	public Map<String,Map<String,ServiceClass>> getServices() {
		return serviceCrawlerDao.getServices();
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) {
		try {
			serviceCrawlerDao.itemCount(request, response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Count failed", response);
			e.printStackTrace();
		}
	}

	@Override
	public void item(RestRequest request, RestResponse response) {
		try {
			serviceCrawlerDao.item(request, response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Item failed", response);
			e.printStackTrace();
		}
	}

	@Override
	public void items(RestRequest request, RestResponse response) {
		try {
			serviceCrawlerDao.items(request, response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "List failed", response);
			e.printStackTrace();
		}
	}

	
	protected void initParams(RestRequest request) {
		if (!request.containsParam(BaseEntity.SEARCHCOLUMN)){
			request.addParam(BaseEntity.SEARCHCOLUMN, "serviceName");
		}
		if (!request.containsParam(BaseEntity.ITEMNAME)){
			request.addParam(BaseEntity.ITEMNAME, "ServiceClass");
		}
		if (!request.containsParam(BaseEntity.ORDERCOLUMN)) {
			request.addParam(BaseEntity.ORDERCOLUMN, "category,serviceName");
		}
		if (!request.containsParam(BaseEntity.ORDERDIR)) {
			request.addParam(BaseEntity.ORDERDIR, "ASC");
		}
	}

}
