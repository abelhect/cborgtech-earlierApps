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

package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.ConcurrencyManagement;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.inject.Named;

import org.toasthub.core.system.model.User;


@Named
@Singleton
@ConcurrencyManagement
public class AppCacheChat implements Serializable {

	private static final long serialVersionUID = 1L;
	private Map<String,User> users = new HashMap<String,User>();
	private Map<Date,Integer> stats = new HashMap<Date,Integer>();
	private Map<String,List<ChatMessage>> messageQueue = new HashMap<String,List<ChatMessage>>();
	
	// Constructor
	public AppCacheChat(){
	}
	
	@Schedule(minute="1")
	public void stats(){
		stats.put(new Date(), users.size());
	}
	
	public Map<Date,Integer> getStats(){
		return this.stats;
	}
	
	// App Users
	@Lock(LockType.READ)
	public List<User> getUsers(List<String> userKeys) {
		List<User> users = null;
		if (userKeys != null && userKeys.size() > 0) {
			for (String userKey : userKeys) {
				if (this.users.containsKey(userKey)){
					if (users == null){
						users = new ArrayList<User>();
					}
					users.add(this.users.get(userKey));
				}
			}
		}
		return users;
	}
	
	protected void setUsers(Map<String,User> users) {
		this.users = users;
	}
	
	@Lock(LockType.WRITE)
	public void addUser(String key,User user ){
		if (this.users != null){
			this.users.put(key, user);
		}
	}
	
	@Lock(LockType.WRITE)
	public void clearUsersCache(){
		this.setUsers(new HashMap<String,User>());
	}
	
	@Lock(LockType.WRITE)
	public void clearUser(String key){
		this.users.remove(key);
	}
	
	@Lock(LockType.READ)
	public void checkUsers(List<UserRef> users){
		/*for (UserRef user : users) {
			if (this.users.containsKey(user.getUsername())){
				user.setChatStatus("ONLINE");
			} else {
				user.setChatStatus("OFFLINE");
			}
		}*/
	}
	
	@Lock(LockType.WRITE)
	public void addMessage(ChatMessage chatMessage) {
		List<String> toList = chatMessage.getTolist();
		for (String user : toList) {
			List<ChatMessage> messages = null;
			if (this.messageQueue.containsKey(user)){
				messages = this.messageQueue.get(user);
			} else {
				messages = new ArrayList<ChatMessage>();
			}
			if (messages == null){
				messages = new ArrayList<ChatMessage>();
			}
			messages.add(chatMessage);
			this.messageQueue.put(user, messages);
		}
	}
	
	@Lock(LockType.WRITE)
	public List<ChatMessage> getMessages(String username) {
		List<ChatMessage> messages = null;
		if (this.messageQueue.containsKey(username)){
			messages = this.messageQueue.get(username);
			this.messageQueue.put(username, null);
		}
		
		return messages;
	}
}
