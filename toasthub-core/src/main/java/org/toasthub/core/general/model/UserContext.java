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
import java.util.Set;

import javax.annotation.PreDestroy;
import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Produces;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import javax.inject.Named;

import org.toasthub.core.general.svc.UserManagerSvc;
import org.toasthub.core.system.model.Role;
import org.toasthub.core.system.model.User;


@SessionScoped
@Named
public class UserContext implements Serializable {

   private static final long serialVersionUID = 7965455427888195913L;

   @Inject private Credentials credentials;
   @Inject private AppCacheChat appCacheChat;
   @Inject private UserManagerSvc userManagerSvc;
   
   private User currentUser;
   //private AppUser currentAppUser;
   
  // private AppRole

   //Methods  This is not used old stuff need to remove
   public String login() { 
      User user = userManagerSvc.findUser(credentials.getUsername());
      if (user == null){
    	  FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("This user does not exist would you like to register"));
    	  return "NOUSER";
      }
      if (!user.isEmailConfirm()){
    	  FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("You must confirm your registration or password change using the link provided you in the email"));
    	  return "NOUSER";
      }
     /* boolean authenticated = userManagerSvc.authenticate(user,credentials.getPassword(),null);
      if (authenticated) {
    	  if (user.isActive() && !user.isArchive() && !user.isLocked() && appUser.isActive() && !appUser.isArchive() && !appUser.isLocked()){
    		  currentUser = user;
    		  currentAppUser = appUser;
    		  FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Welcome, " + currentUser.getFirstname()));
    		  return "SUCCESS";
    	  }
    	  LoginLog loginLog = new LoginLog(user,true);
    	  userManagerSvc.logAccess(loginLog);
    	  // to chat watch
    	  appCacheChat.addAppUser(appUser.getUsername(), appUser);
      } else {
    	  LoginLog loginLog = new LoginLog(user,false);
    	  userManagerSvc.logAccess(loginLog);
    	  return "FAIL";
      }*/
      return "FAIL";
   }
   
   public void loginWS(User user){
	   // to chat watch
	  // appCacheChat.addAppUser(appUser.getUsername(), appUser);
	   this.currentUser = user;
	  // this.currentAppUser = appUser;
   }

   public String getLogout() {
	  // logger.info(currentUser.getFirstname() + " is logging out");
	  String result = "Goodbye, " + currentUser.getFirstname();
	 // appCacheChat.clearAppUser(currentAppUser.getUsername());
      currentUser = null;
     // currentAppUser = null;
      return result;
   }

   public boolean isLoggedIn() {
      return currentUser != null;
   }
   
   public boolean hasAccess(String roleCode, String permissionCode , String applicationCode) {
	   Set<Role> roles = currentUser.getRoles();
		boolean allowed = false;
		if (roles.size() > 0){
			for (Role role : roles){
				if (role.getCode().equals(roleCode) && role.getApplication().getCode().equals(applicationCode)){
					allowed = true;
					break;
				}
			}
		}
		return allowed;
   }

   @Produces
   @LoggedIn
   public User getCurrentUser() {
      return currentUser;
   }

   public void updateCurrentUser(User user){
	   this.currentUser = user;
   }
   
   @PreDestroy
   public void destroy() {
	  // logger.info("I am being destroyed");
   }
}