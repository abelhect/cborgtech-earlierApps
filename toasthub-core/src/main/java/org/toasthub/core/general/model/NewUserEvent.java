package org.toasthub.core.general.model;

public class NewUserEvent {

	private String userName;
	private String status;
	
	public NewUserEvent(){
		
	}
	public NewUserEvent(String userName, String status){
		this.userName = userName;
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
