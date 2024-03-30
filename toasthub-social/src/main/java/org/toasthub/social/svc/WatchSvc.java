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

package org.toasthub.social.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.model.AppCacheChat;
import org.toasthub.core.general.model.UserRef;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.MailSvc;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.social.dao.ActivityDao;
import org.toasthub.social.dao.WatchDao;
import org.toasthub.social.model.WatchGroup;

@RequestScoped
public class WatchSvc implements ServiceProcessor {

	@Inject WatchDao watchDao;
	@Inject ActivityDao activityDao;
	@Inject MailSvc mailSvc;
	@Inject UtilSvc utilSvc;
	@Inject AppCacheChat appCacheChat;
	static Map<String,String> paramMap = new HashMap<String,String>();
	static {
		paramMap.put("watchGroupId", "Long");
		paramMap.put("aquaintanceId", "Long");
		paramMap.put("memberId", "Long");
	}
	
	public void process(RestRequest request, RestResponse response) {
		utilSvc.preProcessParams(request, paramMap);
		String action = (String) request.getParam("action");
		
		switch (action) {
		case "INIT": 
			
			break;
		case "LIST":
			if (request.getParam("type").equals("INIT")) {
				// get the lists of groups
				getWatchGroupCount(request, response);
				Long count = (Long) response.getParam("watchGroupCount");
				if (count > 0){
					getWatchGroups(request, response);
					// get the default list
					if(request.getParam("watchGroupId") == null){
						getWatchGroup(request, response);
					}
					getWatchGroupMemberCount(request, response);
					Long countMember = (Long) response.getParam("watchGroupMemberCount");
					if (response.getParam("watchGroupMemberCount") != null && countMember > 0){
						getWatchGroupMembers(request, response);
						List<UserRef> members = (List<UserRef>) response.getParam("members");
						//appCacheChat.checkUsers(members);
					}
					
				} else {
					// create a default group
					WatchGroup wg = new WatchGroup("Default","Aquaintances");
					request.addParam("watchGroup", wg);
					saveWatchGroup(request, response);
				}
			} else if (request.getParam("type").equals("GROUP")) {
				getWatchGroupCount(request, response);
				Long count = (Long) response.getParam("watchGroupCount");
				if (count > 0){
					getWatchGroups(request, response);
				} else {
					
				}
			} else if (request.getParam("type").equals("MEMBERS")){
				getWatchGroupMemberCount(request, response);
				Long count = (Long) response.getParam("watchGroupMemberCount");
				if (count > 0){
					getWatchGroupMembers(request, response);
					List<UserRef> members = (List<UserRef>) response.getParam("members");
					//appCacheChat.checkUsers(members);
				}
			}
			break;
		case "SHOW":
			
			break;
		case "DELETE":
			
			break;
		case "SAVE":
			if (request.getParams().containsKey("message")) {
				String message = (String) request.getParam("message");
				response.addParam("message", message);
			} else if (request.getParams().containsKey("subAction")){
				if (request.getParam("subAction").equals("SaveWatchGroupMember")){
					saveWatchGroupMember(request, response);
				}
			}
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
		
	}
	
	public void getWatchGroups(RestRequest request, RestResponse response) {
		try {
			watchDao.getWatchGroups(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getWatchGroup(RestRequest request, RestResponse response) {
		try {
			watchDao.getWatchGroup(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getWatchGroupMembers(RestRequest request, RestResponse response) {
		try {
			watchDao.getWatchGroupMembers(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void getWatchGroupCount(RestRequest request, RestResponse response) {
		try {
			watchDao.getWatchGroupCount(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void getWatchGroupMemberCount(RestRequest request, RestResponse response) {
		try {
			watchDao.getWatchGroupMemberCount(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void saveWatchGroup(RestRequest request, RestResponse response) {
		try {
			watchDao.saveWatchGroup(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save WatchGroup Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Unable to complete request", response);
			e.printStackTrace();
		}
	}
	
	public void saveWatchGroupMember(RestRequest request, RestResponse response) {
		try {
			watchDao.saveWatchGroupMember(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Save WatchGroup Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Unable to complete request", response);
			e.printStackTrace();
		}
	}

	public void deleteWatchGroup(RestRequest request, RestResponse response) {
		try {
			watchDao.deleteWatchGroup(request, response);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete Watch Group Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Unable to complete request", response);
			e.printStackTrace();
		}
	}
	
}
