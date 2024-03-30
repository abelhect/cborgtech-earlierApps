/**
 * @author Edward H. Seufert
 * Copyright (C) 2016 CBorgTech
 */

cthreatIndex.prototype = Object.create(toastHubBase.prototype);
cthreatIndex.prototype.constructor = cthreatIndex;

toastHub.registerController("index",new cthreatIndex());

function cthreatIndex(instanceName){
	toastHubBase.call(this,instanceName,this);
	this.TAG = "index::cthreatIndex::";
	this.ajaxFunc = "member";
	this.service = "MEMBER_SVC";
	this.pageMetaName = "MEMBER_INDEX";
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
		introLeadIn.innerHTML = "";
		introText.appendChild(introLeadIn);

		var introHeading = document.createElement("DIV");
		introHeading.className = "intro-heading";
		introHeading.innerHTML = "Map here";
		introText.appendChild(introHeading);
		
	
	}; // headerRenderer
	


	
	this.testParams = function(params) {
		
		return params;
	}; // testParams
};