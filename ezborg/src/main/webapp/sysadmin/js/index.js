/**
 * @author Edward H. Seufert
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

sysadminIndex.prototype = Object.create(toastHubBase.prototype);
sysadminIndex.prototype.constructor = sysadminIndex;

toastHub.registerController("index",new sysadminIndex());

function sysadminIndex(instanceName){
	toastHubBase.call(this,instanceName,this);
	this.TAG = "index::sysadminIndex::";
	this.ajaxFunc = "sysadmin";
	this.service = "SYSADMIN_SVC";
	this.pageMetaName = "SYSADMIN_INDEX";
	var self = this;
	
	this.initContent = function(params){
		toastHub.logSystem.log("DEBUG",this.TAG+"initContent");
		params = this.testParams(params);
		params.parent = toastHub.body;
		// add header
		this.headerRenderer(params);
		
		
	}; // initContent
	
	this.headerRenderer = function(params) {
		toastHub.logSystem.log("DEBUG",this.TAG+"headerRenderer");
		var header = document.createElement("header");
		params.parent.appendChild(header);
		var container = document.createElement("DIV");
		container.className = "intro-text";
		header.appendChild(container);
		var introText = document.createElement("DIV");
		container.appendChild(introText);
		var introLeadIn = document.createElement("DIV");
		introLeadIn.className = "intro-lead-in";
		introLeadIn.innerHTML = "Welcome to system admin area";
		introText.appendChild(introLeadIn);
		
	}; // headerRenderer
	

};