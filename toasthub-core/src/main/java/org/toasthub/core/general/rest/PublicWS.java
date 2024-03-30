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

package org.toasthub.core.general.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ServiceCrawler;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;


@Path("/public")
public class PublicWS {

	@Inject	EntityManagerSvc entityManagerSvc;
	@Inject UtilSvc utilSvc;
	@Inject ServiceCrawler serviceLocator;
	
	@POST
	@Path("/callService")
	@Consumes({"application/json", "application/xml"})
	@Produces({"application/json", "application/xml"})
	public String callService(RestRequest request) {

		RestResponse response = new RestResponse();
		// set defaults
		utilSvc.setupDefaults(request);
		// validate request

		
		// call service locator
		ServiceProcessor x = serviceLocator.getService("PUBLIC",(String) request.getParam(BaseEntity.SERVICE),
				(String) request.getParam(BaseEntity.SVCAPIVERSION), (String) request.getParam(BaseEntity.SVCAPPVERSION),
				entityManagerSvc.getAppDomain());
		// process 
		if (x != null) {
			x.process(request, response);
		} else {
		}
		
		return utilSvc.writeResponsePublic(response);
	}
}
