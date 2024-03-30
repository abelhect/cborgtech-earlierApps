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

@Path("/login")
public class LoginWS {
	
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
		
		response.addParam(BaseEntity.APPNAME,entityManagerSvc.getAppName());
		// response
		response.addParam(BaseEntity.CONTEXTPATH, entityManagerSvc.getAppName());
		// call service locator
		ServiceProcessor x = serviceLocator.getService("LOGIN",(String) request.getParams().get(BaseEntity.SERVICE),
				(String) request.getParam(BaseEntity.SVCAPIVERSION), (String) request.getParam(BaseEntity.SVCAPPVERSION),
				entityManagerSvc.getAppDomain());
		// process 
		if (x != null) {
			x.process(request, response);
		} else {
		
		}
		// response
		response.addParam(BaseEntity.PAGESTART, request.getParam(BaseEntity.PAGESTART));
		response.addParam(BaseEntity.PAGELIMIT, request.getParam(BaseEntity.PAGELIMIT));
		return utilSvc.writeResponseAdmin(response);
	}
	
}
