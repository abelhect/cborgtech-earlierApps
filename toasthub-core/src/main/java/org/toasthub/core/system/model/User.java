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
package org.toasthub.core.system.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonView;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.toasthub.core.general.model.ajax.JsonViews;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

/**
 * @author Edward H. Seufert
 */
@Entity
@Table(name = "users")
public class User extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	public static String[] columns = {"firstname","middlename","lastname","active","username","created"};
	public static String[] dataTypes = {"string","string","string","boolean","string","date"};
	
	protected String username;
	protected String password;
	protected String verifyPassword;
	protected String salt;
	protected String firstname;
	protected String middlename;
	protected String lastname;
	protected String email;
	protected String zipcode;
	protected String challengePhase1;
	protected String challengePhaseAnswer1;
	protected String challengePhase2;
	protected String challengePhaseAnswer2;
	protected String challengePhase3;
	protected String challengePhaseAnswer3;
	protected String alternateEmail;
	protected String sessionToken;
	protected String emailToken;
	protected boolean useToken;
	protected boolean emailConfirm;
	protected boolean forceReset;
	protected String lang;
	protected String logLevel;
	protected Date lastPassChange; // last password change this will be use to force password reset after x days
	protected Set<Role> roles;
	
	private String chatStatus;
	private boolean connected;
	private boolean pendingInvite;
	
	// Constructors
	public User() {
	}
	public User(String username, String password, String firstname, String lastname, String middlename, String zipcode, String lang){
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		this.setLastPassChange(new Date());
		this.setUsername(username);
		this.setPassword(password);
		this.setFirstname(firstname);
		this.setLastname(lastname);
		this.setMiddlename(middlename);
		this.setZipcode(zipcode);
		this.setLang(lang);
	}
	// Constructor for list
	public User(Long id, String firstname, String middlename, String lastname, boolean active, String username, Date created){
		this.setId(id);
		this.setFirstname(firstname);
		this.setMiddlename(middlename);
		this.setLastname(lastname);
		this.setActive(active);
		this.setUsername(username);
		this.setCreated(created);
	}
	// Constructor for ajax
	public User(RestRequest request, RestResponse response, String formName){
		this.setActive(true);
		this.setArchive(false);
		this.setLocked(false);
		this.setCreated(new Date());
		userInputHelper(request, response, formName);
	}
	// Setters/Getters
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 255)
	@Column(name = "username")	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	@JsonIgnore
	@Size(min = 1, max = 255)
	@Column(name = "password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Transient
	public String getVerifyPassword() {
		return verifyPassword;
	}
	public void setVerifyPassword(String verifyPassword) {
		this.verifyPassword = verifyPassword;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 255)
	@Column(name = "firstname")
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "middlename")
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@NotNull
	@NotEmpty
	@Size(min = 1, max = 255)
	@Column(name = "lastname")
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@NotNull
	@NotEmpty
	@Size(min = 5, max = 50)
	@Column(name = "zipcode")
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@NotNull
	@NotEmpty
	@Email
	@Size(min = 1, max = 255)
	@Column(name = "email")	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephase1")
	public String getChallengePhase1() {
		return challengePhase1;
	}
	public void setChallengePhase1(String challengePhase1) {
		this.challengePhase1 = challengePhase1;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephaseanswer1")
	public String getChallengePhaseAnswer1() {
		return challengePhaseAnswer1;
	}
	public void setChallengePhaseAnswer1(String challengePhaseAnswer1) {
		this.challengePhaseAnswer1 = challengePhaseAnswer1;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephase2")
	public String getChallengePhase2() {
		return challengePhase2;
	}
	public void setChallengePhase2(String challengePhase2) {
		this.challengePhase2 = challengePhase2;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephaseanswer2")
	public String getChallengePhaseAnswer2() {
		return challengePhaseAnswer2;
	}
	public void setChallengePhaseAnswer2(String challengePhaseAnswer2) {
		this.challengePhaseAnswer2 = challengePhaseAnswer2;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephase3")
	public String getChallengePhase3() {
		return challengePhase3;
	}
	public void setChallengePhase3(String challengePhase3) {
		this.challengePhase3 = challengePhase3;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "challengephaseanswer3")
	public String getChallengePhaseAnswer3() {
		return challengePhaseAnswer3;
	}
	public void setChallengePhaseAnswer3(String challengePhaseAnswer3) {
		this.challengePhaseAnswer3 = challengePhaseAnswer3;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Size(max = 255)
	@Column(name = "alternateEmail")
	public String getAlternateEmail() {
		return alternateEmail;
	}
	public void setAlternateEmail(String alternateEmail) {
		this.alternateEmail = alternateEmail;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Size(max = 255)
	@Column(name = "session_token")
	public String getSessionToken() {
		return sessionToken;
	}
	public void setSessionToken(String sessionToken) {
		this.sessionToken = sessionToken;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Size(max = 255)
	@Column(name = "email_token")
	public String getEmailToken() {
		return emailToken;
	}
	public void setEmailToken(String emailToken) {
		this.emailToken = emailToken;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "use_token")
	public boolean isUseToken() {
		return useToken;
	}
	public void setUseToken(boolean useToken) {
		this.useToken = useToken;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "salt")
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "email_confirm")
	public boolean isEmailConfirm() {
		return emailConfirm;
	}
	public void setEmailConfirm(boolean emailConfirm) {
		this.emailConfirm = emailConfirm;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "force_reset")
	public boolean isForceReset() {
		return forceReset;
	}
	public void setForceReset(boolean forceReset) {
		this.forceReset = forceReset;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "lang")
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "log_level")
	public String getLogLevel() {
		return logLevel;
	}
	public void setLogLevel(String logLevel) {
		this.logLevel = logLevel;
	}
	
	@JsonView({JsonViews.JsonAdmin.class})
	@Column(name = "last_pass_change")
	public Date getLastPassChange() {
		return lastPassChange;
	}
	public void setLastPassChange(Date lastPassChange) {
		this.lastPassChange = lastPassChange;
	}
	
	@JsonIgnore
	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Transient
	public String getChatStatus() {
		return chatStatus;
	}
	public void setChatStatus(String chatStatus) {
		this.chatStatus = chatStatus;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Transient
	public boolean isConnected() {
		return connected;
	}
	public void setConnected(boolean connected) {
		this.connected = connected;
	}
	
	@JsonView({JsonViews.JsonAdmin.class,JsonViews.JsonMember.class})
	@Transient
	public boolean isPendingInvite() {
		return pendingInvite;
	}
	public void setPendingInvite(boolean pendingInvite) {
		this.pendingInvite = pendingInvite;
	}
	
}
