package org.toasthub.core.general.model;

import java.io.Serializable;

import javax.enterprise.context.RequestScoped;
import javax.inject.Named;

@RequestScoped
@Named
public class Credentials implements Serializable{

	private static final long serialVersionUID = 1L;
	private String username;
	private String password;

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

}