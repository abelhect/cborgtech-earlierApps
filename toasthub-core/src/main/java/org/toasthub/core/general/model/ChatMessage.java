package org.toasthub.core.general.model;

import java.util.List;


public class ChatMessage {

	private Long fromRefId;
	private List<String> tolist;
	private String message;
	private String timeSent;
	
	// Constructors
	public ChatMessage() {}
	
	public ChatMessage(Long fromRefId, List<String> toList, String message,String timeSent) {
		this.fromRefId = fromRefId;
		this.tolist = toList;
		this.message = message;
		this.timeSent = timeSent;
	}
	
	public Long getFromRefId() {
		return fromRefId;
	}
	public void setFrom(Long fromRefId) {
		this.fromRefId = fromRefId;
	}
	
	public List<String> getTolist() {
		return tolist;
	}
	public void setTolist(List<String> tolist) {
		this.tolist = tolist;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public String getTimeSent() {
		return timeSent;
	}

	public void setTimeSent(String timeSent) {
		this.timeSent = timeSent;
	}
	
}
