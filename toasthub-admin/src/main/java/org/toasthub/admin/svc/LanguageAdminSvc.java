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

package org.toasthub.admin.svc;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.admin.dao.LanguageAdminDaoIface;
import org.toasthub.admin.dao.LanguageAdminDaoQual;
import org.toasthub.core.general.model.AppCachePage;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Language;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.LanguageSvc;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.security.svc.Authorize;

@LanguageAdminSvcQual
@RequestScoped
public class LanguageAdminSvc extends LanguageSvc implements ServiceProcessor, LanguageAdminSvcIface {

	@Inject @LanguageAdminDaoQual LanguageAdminDaoIface languageDao;
	@Inject	AppCachePage appCachePage;
	@Inject UtilSvc utilSvc;
	
	@Override
	public void process(RestRequest request, RestResponse response) {
		String action = (String) request.getParams().get(BaseEntity.ACTION);
		
		Long count = 0l;
		switch (action) {
		case "INIT":
			request.addParam(AppCachePage.APPPAGEPARAMLOC, AppCachePage.RESPONSE);
			appCachePage.getPageInfo(request,response);
			this.itemCount(request, response);
			count = (Long) response.getParam(BaseEntity.ITEMCOUNT);
			if (count != null && count > 0){
				this.items(request, response);
			}
			response.addParam(BaseEntity.ITEMNAME, request.getParam(BaseEntity.ITEMNAME));
			break;
		case "LIST":
			request.addParam(AppCachePage.APPPAGEPARAMLOC, AppCachePage.RESPONSE);
			appCachePage.getPageInfo(request,response);
			this.itemCount(request, response);
			count = (Long) response.getParam(BaseEntity.ITEMCOUNT);
			if (count != null && count > 0){
				this.items(request, response);
			}
			response.addParam(BaseEntity.ITEMNAME, request.getParam(BaseEntity.ITEMNAME));
			break;
		case "SHOW":
			//this.item(request, response);
			break;
		case "DELETE":
			this.delete(request, response);
			break;
		case "SAVE":
			appCachePage.getPageInfo(request,response);
			this.save(request, response);
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}

	@Authorize
	public void delete(RestRequest request, RestResponse response) {
		try {
			languageDao.delete(request, response);
			// reset cache
			appCachePage.clearLanguageCache();
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
			e.printStackTrace();
		}
	} // delete
	
	@Authorize
	public void save(RestRequest request, RestResponse response) {
		try {
			// validate
			utilSvc.validateParams(request, response);
			
			if ((Boolean) request.getParam(BaseEntity.VALID) == false) {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Validation Error", response);
				return;
			}
			// get existing item
			if (request.containsParam(BaseEntity.ITEMID) && !request.getParam(BaseEntity.ITEMID).equals("")) {
				languageDao.item(request, response);
				request.addParam(BaseEntity.ITEM, response.getParam(BaseEntity.ITEM));
				response.getParams().remove(BaseEntity.ITEM);
			} else {
				request.addParam(BaseEntity.ITEM, new Language());
			}
			// marshall
			utilSvc.marshallFields(request, response);
			// check for default - only one item can be default
			Language language = (Language) request.getParam(BaseEntity.ITEM);
			
			if (language.isDefaultLang()){
				// find old default and set to false
				RestRequest oldLangRequest = new RestRequest();
				RestResponse oldLangResponse = new RestResponse();
				try {
					languageDao.getDefault(oldLangRequest, oldLangResponse);
					// save
					Language oldDefault = (Language) oldLangResponse.getParam(BaseEntity.ITEM);
					oldDefault.setDefaultLang(false);
					oldLangRequest.addParam(BaseEntity.ITEM, oldDefault);
					languageDao.save(oldLangRequest, oldLangResponse);
				} catch (Exception e) {
					if (!e.getMessage().contains("No entity found for query")) {
						throw new Exception(e);
					}
					
				}
				
			}
			
			// save
			languageDao.save(request, response);

			// reset cache
			appCachePage.clearLanguageCache();
			
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Save Failed", response);
			e.printStackTrace();
		}
	} // save
	
}
