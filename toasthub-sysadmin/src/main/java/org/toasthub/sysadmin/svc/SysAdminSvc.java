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

package org.toasthub.sysadmin.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.model.AppCacheMenu;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.MenuItem;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.BaseRestResponse;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.MenuSvcIface;
import org.toasthub.core.general.svc.MenuSvcQual;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.sysadmin.model.ajax.SysAdminAction;

@RequestScoped
public class SysAdminSvc implements ServiceProcessor {
	
	@Inject UtilSvc utilSvc;
	@Inject	EntityManagerSvc entityManagerSvc;
	@Inject UserContext login;
	@Inject AppCacheMenu appCacheMenu;
	@Inject	@MenuSvcQual MenuSvcIface menuSvc;

	// Constructors
	public SysAdminSvc() {}
	
	// Processor
	public void process(RestRequest request, RestResponse response) {
		SysAdminAction action = Enum.valueOf(SysAdminAction.class, (String) request.getParams().get(BaseEntity.ACTION));
		
		this.setupDefaults(request);
		
		switch (action) {
		case INIT: 
			this.init(request, response);
			break;
		case INIT_MENU:
			this.setMenuDefaults(request);
			this.initMenu(request, response);
			break;
		default:
			break;
		}
		
	
	}
	
	public void init(RestRequest request, RestResponse response) {
		response.addParam(BaseEntity.PAGELAYOUT,entityManagerSvc.getSysAdminLayout());
		response.addParam(BaseEntity.APPNAME,entityManagerSvc.getAppName());
		response.addParam(BaseEntity.HTMLPREFIX, entityManagerSvc.getHTMLPrefix());
		// contextpath
		response.addParam(BaseEntity.CONTEXTPATH, entityManagerSvc.getAppName());
	}
	
	public void initMenu(RestRequest request, RestResponse response){
		Map<Integer,MenuItem> menu = null;
		Map<String,Map<Integer,MenuItem>> menuList = new HashMap<String,Map<Integer,MenuItem>>();
		
		ArrayList<String> mylist = (ArrayList<String>) request.getParam(BaseEntity.MENUNAMES);
		for (String menuName : mylist) {
			menu = appCacheMenu.getMenu(menuName+"_"+entityManagerSvc.getAppName()+"_"+request.getParam(BaseEntity.MENUAPIVERSION)+"_"+request.getParam(BaseEntity.MENUAPPVERSION)+"_"+request.getParam(BaseEntity.LANG));
			if (menu == null){
				menu = menuSvc.getMenu(menuName,(String)request.getParam(BaseEntity.MENUAPIVERSION),(String)request.getParam(BaseEntity.MENUAPPVERSION),(String)request.getParam(BaseEntity.LANG));
				if (menu != null){
					appCacheMenu.addMenu(menuName+"_"+entityManagerSvc.getAppName()+"_"+request.getParam(BaseEntity.MENUAPIVERSION)+"_"+request.getParam(BaseEntity.MENUAPPVERSION)+"_"+request.getParam(BaseEntity.LANG),menu);
				}
			}
			menuList.put(menuName, menu);
		}

		response.setUsername(login.getCurrentUser().getFirstname()+" "+login.getCurrentUser().getLastname());
		
		
		if (!menuList.isEmpty()){
			response.addParam(BaseRestResponse.MENUS, menuList);
		} else {
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Menu Issue", response);
		}
	}
	
	public void setupDefaults(RestRequest request){
		
		if (!request.containsParam(BaseEntity.MENUAPIVERSION)){
			request.addParam(BaseEntity.MENUAPIVERSION, "1.0");
		}

		if (!request.containsParam(BaseEntity.MENUAPPVERSION)){
			request.addParam(BaseEntity.MENUAPPVERSION, "1.0");
		}
		
	}
	
	public void setMenuDefaults(RestRequest request) {
		if (!request.containsParam(BaseEntity.MENUNAMES)){
			ArrayList<String> myList = new ArrayList<String>();
			myList.add("SYSADMIN_MENU_LEFT");
			myList.add("SYSADMIN_MENU_RIGHT");
			request.addParam(BaseEntity.MENUNAMES, myList);
		}
	}
}