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
	this.ajaxFunc = "public";
	this.service = "PUBLIC_SVC";
	this.pageMetaName = "PUBLIC_INDEX";
	var self = this;
	
	this.initContent = function(params){
		toastHub.logSystem.log("DEBUG",this.TAG+"initContent");
		params = this.testParams(params);
		params.parent = toastHub.body;
		// add header
		this.headerRenderer(params);
		
		
		// add team
		this.teamRenderer(params);
		
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
		introHeading.innerHTML = "<h1>Your <strong>Safety</strong> is our priority</h1>";
		introText.appendChild(introHeading);
		
		var introLeadIn = document.createElement("DIV");
		introLeadIn.className = "intro-lead-in";
		introLeadIn.innerHTML = "<p>Alerting our communities, first responders and loved ones about unexpected <strong>emergency events</strong> and <strong>suspicious activities</strong>. Watch our promotional video and download our app to become a member.</p>";
		introText.appendChild(introLeadIn);
		
		var link = document.createElement("a");
		link.href = "watch.html";
		link.className = "btn btn-primary btn-lg";
		link.setAttribute("role","button");
		link.innerHTML = "<strong>Watch &raquo;</strong>";
		introText.appendChild(link);
	}; // headerRenderer
	


	this.teamRenderer = function(params) {
		toastHub.logSystem.log("DEBUG",this.TAG+"teamRenderer");
		var section = document.createElement("SECTION");
		section.id = "team";
		section.className = "bg-light-gray";
		params.parent.appendChild(section);

		var container = document.createElement("DIV");
		container.className = "container";
		section.appendChild(container);
		
		var row1 = document.createElement("DIV");
		row1.className = "row";
		container.appendChild(row1);
		
		var colHeading = document.createElement("DIV");
		colHeading.className = "col-lg-12 text-center";
		row1.appendChild(colHeading);
		
		var heading = document.createElement("H2");
		heading.className = "section-heading";
		heading.innerHTML = params.teamWidget.heading;
		colHeading.appendChild(heading);
		
		var headingDesc = document.createElement("H3");
		headingDesc.className = "section-subheading text-muted";
		headingDesc.innerHTML = params.teamWidget.headingDesc;
		colHeading.appendChild(headingDesc);
		
		var row2 = document.createElement("DIV");
		row2.className = "row";
		container.appendChild(row2);
		
		var members = params.teamWidget.members;
		for( i = 0; i < members.length; i++) {
		
			var col = document.createElement("DIV");
			col.className = "col-sm-4";
			row2.appendChild(col);
			var teamMember = document.createElement("DIV");
			teamMember.className = "team-member";
			col.appendChild(teamMember);
			var image = document.createElement("IMG");
			image.src = members[i].srcImg;
			image.className = "img-responsive img-circle";
			image.alt = "";
			teamMember.appendChild(image);
			var name = document.createElement("H4");
			name.innerHTML = members[i].name;
			teamMember.appendChild(name);
			var title = document.createElement("p");
			title.className = "text-muted";
			title.innerHTML = members[i].title;
			teamMember.appendChild(title);
			var linksUL = document.createElement("UL");
			linksUL.className = "list-inline social-buttons";
			teamMember.appendChild(linksUL);
			var li1 = document.createElement("LI");
			li1.innerHTML = "<a href='#'><i class='fa fa-twitter'></i></a>";
			linksUL.appendChild(li1);
			var li2 = document.createElement("LI");
			li2.innerHTML = "<a href='#'><i class='fa fa-facebook'></i></a>";
			linksUL.appendChild(li2);
			var li3 = document.createElement("LI");
			li3.innerHTML = "<a href='#'><i class='fa fa-linkedin'></i></a>";
			linksUL.appendChild(li3);
		
		}
		
		var row3 = document.createElement("DIV");
		row3.className = "row";
		container.appendChild(row3);
		var colFinal = document.createElement("DIV");
		colFinal.className = "col-lg-8 col-lg-offset-2 text-center";
		row3.appendChild(colFinal);
		var final = document.createElement("P");
		final.className = "large text-muted";
		final.innerHTML = "Final conmment";
		colFinal.appendChild(final);
		
		
	}; // teamRenderer
	
	this.testParams = function(params) {
		params.teamWidget = {heading:"Our Amazing Team",headingDesc:"Innovating Engineers",
				members:[{srcImg:"img/team/ed.jpg",alt:"",name:"Edward Seufert",title:"Java Guru"},
				         {srcImg:"img/team/hector.jpg",alt:"",name:"Hector Martinez",title:"Android Guru"}]};
		params.servicesWidget = [{cssPic:"fa-shopping-cart",serviceHeading:"E-Commerce",serviceDesc:"Testing"},
		                    {cssPic:"fa-laptop",serviceHeading:"Responsive Design",serviceDesc:"Testing"},
		                    {cssPic:"fa-lock",serviceHeading:"Web Security",serviceDesc:"Testing"}];
		return params;
	}; // testParams
};