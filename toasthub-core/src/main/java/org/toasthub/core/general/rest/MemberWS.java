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

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;
import org.toasthub.core.general.model.AttachmentMeta;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.ServiceCrawler;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

import com.google.gson.Gson;

@Path("/member")
public class MemberWS {

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
		
		// response
		response.addParam(BaseEntity.CONTEXTPATH, entityManagerSvc.getAppName());
				
		// call service locator
		ServiceProcessor x = serviceLocator.getService("MEMBER", (String) request.getParams().get(BaseEntity.SERVICE),
				(String) request.getParam(BaseEntity.SVCAPIVERSION), (String) request.getParam(BaseEntity.SVCAPPVERSION),
				entityManagerSvc.getAppDomain());
		// process 
		if (x != null) {
			x.process(request, response);
		} else {
		
		}
		
		return utilSvc.writeResponseMember(response);
	}
	
	@POST
	@Path("/uploadService")
	@Consumes("multipart/form-data")
	@Produces({"application/json", "application/xml"})
	public String uploadService(MultipartFormDataInput input){
		RestResponse response = new RestResponse();
		RestRequest request = new RestRequest();
		input.getParts();
		Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
		try {
			String paramString = uploadForm.get(BaseEntity.PARAMS).get(0).getBodyAsString();
			Map<String,Object> paramObj = new Gson().fromJson(paramString,Map.class);
			Map<String,Object> params = (Map<String,Object>) paramObj.get(BaseEntity.PARAMS);
			request.setParams(params);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// set defaults
		utilSvc.setupDefaults(request);
		request.addParam("uploadForm", uploadForm);
		// call service locator

		ServiceProcessor x = serviceLocator.getService("MEMBER", (String) request.getParams().get(BaseEntity.SERVICE),
				(String) request.getParam(BaseEntity.SVCAPIVERSION), (String) request.getParam(BaseEntity.SVCAPPVERSION),
				entityManagerSvc.getAppDomain());
		// process 
		if (x != null) {
			x.process(request, response);
		} else {
		
		}
		
		return utilSvc.writeResponseMember(response);
	}
	
	@POST
	@Path("/downloadService")
	@Consumes({"application/json", "application/xml"})
	@Produces("image/png")
	public Response downloadService(RestRequest request){
		RestResponse response = new RestResponse();
		// set defaults
		utilSvc.setupDefaults(request);

		
		// call service locator
		ServiceProcessor x = serviceLocator.getService("MEMBER", (String) request.getParams().get(BaseEntity.SERVICE),
				(String) request.getParam(BaseEntity.SVCAPIVERSION), (String) request.getParam(BaseEntity.SVCAPPVERSION),
				entityManagerSvc.getAppDomain());
		// process 
		if (x != null) {
			x.process(request, response);
		} else {
		
		}
		ResponseBuilder outResponse = null;
		AttachmentMeta attachment = (AttachmentMeta) response.getParam("attachment");
		if ( "FULLRES".equals(request.getParam("fileType")) ){
			if (attachment.getData() != null && attachment.getData().getData() != null) {
				outResponse = Response.ok((Object) attachment.getData().getData());
			}
		} else {
			if (attachment.getThumbNail() != null && attachment.getThumbNail().getData() != null){
				outResponse = Response.ok((Object) attachment.getThumbNail().getData());
			}
		}
		
		if (outResponse != null){
			outResponse.header("Content-Disposition","attachment; filename="+attachment.getFileName());
			return outResponse.build();
		} else {
			outResponse = Response.noContent();
			return null;
		}
	}
}
