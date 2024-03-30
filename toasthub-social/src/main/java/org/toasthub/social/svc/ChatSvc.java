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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.model.AppCacheChat;
import org.toasthub.core.general.model.AppCachePage;
import org.toasthub.core.general.model.ChatMessage;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;

@RequestScoped
public class ChatSvc implements ServiceProcessor {

	@Inject UtilSvc utilSvc;
	@Inject UserContext userContext;
	@Inject AppCacheChat appCacheChat;
	@Inject	AppCachePage appCachePage;
	static Map<String,String> paramMap = new HashMap<String,String>();
	static {
		paramMap.put("aquaintanceId", "Long");
	}
	
	public void process(RestRequest request, RestResponse response) {
		utilSvc.preProcessParams(request, paramMap);
		
		String action = (String) request.getParam("action");
		
		switch (action) {
		case "INIT": 

			break;
		case "LIST":
			List<ChatMessage> messages = appCacheChat.getMessages(userContext.getCurrentUser().getUsername());
			response.addParam("messages", messages);
			break;
		case "SAVE":
			if (request.getParams().containsKey("username") && request.getParams().containsKey("message")) {
				String timeSent = "";
				if (request.getParams().containsKey("datetime")) {
					timeSent = (String) request.getParam("datetime");
				}
				List<String> toList = new ArrayList<String>();
				toList.add((String) request.getParam("username"));
				//ChatMessage chatMessage = new ChatMessage(userContext.getCurrentUser(),toList,(String) request.getParam("message"),timeSent);
				//appCacheChat.addMessage(chatMessage);
				//response.getParams().put("message", chatMessage);
				//response.addParam("acquaintanceId", request.getParam("acquaintanceId"));
			}
			break;
		default:
			utilSvc.addStatus(RestResponse.INFO, RestResponse.ACTIONNOTEXIST, "Action not available", response);
			break;
		}
	}
}
