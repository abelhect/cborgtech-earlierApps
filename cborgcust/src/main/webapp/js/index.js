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

toastHubIndex.prototype = Object.create(toastHubBase.prototype);
toastHubIndex.prototype.constructor = toastHubIndex;

toastHub.registerController("index",new toastHubIndex());

function toastHubIndex(instanceName){
	toastHubBase.call(this,instanceName,this);
	this.ajaxFunc = "public";
	this.service = "PUBLIC_SVC";
	this.pageMetaName = "PUBLIC_INDEX";
	var self = this;
	
	this.initContent = function(params){
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::initContent");
		params = this.testParams(params);
		params.mainContainer = toastHub.body;
		// add header
		this.headerRenderer(params);
		
		// add services
		this.serviceRenderer(params);
		
		// add portfolio
		this.portfolioRenderer(params);
		
		// add about
		this.aboutRenderer(params);
		
		// add team
		this.teamRenderer(params);
		
	}; // initContent
	
	this.headerRenderer = function(params) {
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::headerRenderer");
		var header = document.createElement("header");
		params.mainContainer.appendChild(header);
		var container = document.createElement("DIV");
		container.className = "intro-text";
		header.appendChild(container);
		var introText = document.createElement("DIV");
		container.appendChild(introText);
		var introLeadIn = document.createElement("DIV");
		introLeadIn.className = "intro-lead-in";
		introLeadIn.innerHTML = "Automating business tasks one application at a time!";
		introText.appendChild(introLeadIn);
//		var introHeading = document.createElement("DIV");
//		introHeading.className = "intro-heading";
//		introHeading.innerHTML = "Tired of the same manual and repetitive business tasks?  Let us introduce automation to your business via mobile and web enterprise applications.";
//		introText.appendChild(introHeading);
		var link = document.createElement("a");
		link.href = "#services";
		link.className = "page-scroll btn btn-xl";
		link.innerHTML = "Tell Me More";
		introText.appendChild(link);
	}; // headerRenderer
	
	this.serviceRenderer = function(params) {
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::serviceRenderer");
		var services = params.servicesWidget;
		var section = document.createElement("SECTION");
		section.id = "services";
		params.mainContainer.appendChild(section);
		var container = document.createElement("DIV");
		container.className = "container";
		section.appendChild(container);
		// header
		var row = document.createElement("DIV");
		row.className = "row";
		container.appendChild(row);
			var headingWrap = document.createElement("DIV");
			headingWrap.className = "col-lg-12 text-center";
			row.appendChild(headingWrap);
			var header = document.createElement("H2");
			header.className = "section-heading";
			header.innerHTML = "Services";
			headingWrap.appendChild(header);
			var headerDesc = document.createElement("H3");
			headerDesc.className = "section-subheading text-muted";
			headerDesc.innerHTML = "The platform is king";
			headingWrap.appendChild(headerDesc);
		// content	
		var rowContent = document.createElement("DIV");
		rowContent.className = "row text-center";
		container.appendChild(rowContent);
		
		// loop through services
		for (var i = 0; i < services.length; i++) {
			var col = document.createElement("DIV");
			col.className = "col-md-4";
			rowContent.appendChild(col);
				var span = document.createElement("SPAN");
				span.className = "fa-stack fa-4x";
				col.appendChild(span);
				var picWrap = document.createElement("i");
				picWrap.className = "fa fa-circle fa-stack-2x text-primary";
				span.appendChild(picWrap);
				var pic = document.createElement("i");
				pic.className = "fa "+ services[i].cssPic +" fa-stack-1x fa-inverse";
				span.appendChild(pic);
			var serviceHeading = document.createElement("H4");
			serviceHeading.className = "service-heading";
			serviceHeading.innerHTML = services[i].serviceHeading;
			col.appendChild(serviceHeading);
			var serviceDesc = document.createElement("p");
			serviceDesc.className = "text-muted";
			serviceDesc.innerHTML = services[i].serviceDesc;
			col.appendChild(serviceDesc);
		}
	
	}; // serviceRenderer
	
	this.portfolioRenderer = function(params) {
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::portfolioRenderer");
		var section = document.createElement("SECTION");
		section.id = "portfolio";
		section.className = "bg-light-gray";
		params.mainContainer.appendChild(section);

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
		heading.innerHTML = params.portfolioWidget.heading;
		colHeading.appendChild(heading);
		
		var headingDesc = document.createElement("H3");
		headingDesc.className = "section-subheading text-muted";
		headingDesc.innerHTML = params.portfolioWidget.headingDesc;
		colHeading.appendChild(headingDesc);
		
		var row2 = document.createElement("DIV");
		row2.className = "row";
		container.appendChild(row2);
		
		var portfolios = params.portfolioWidget.portfolios;
		for( i = 0; i < portfolios.length; i++) {
			var col = document.createElement("DIV");
//			col.className = "col-md-4 col-sm-6 portfolio-item";
			col.className = "col-md-6 col-sm-6 portfolio-item";
			row2.appendChild(col);
			var modal = document.createElement("A");
			modal.href = portfolios[i].modalLink;
			modal.className = "portfolio-link";
			modal.setAttribute("data-toggle","modal");
			col.appendChild(modal);
			var hover = document.createElement("DIV");
			hover.className = "portfolio-hover";
			modal.appendChild(hover);
			var hoverContent = document.createElement("DIV");
			hoverContent.className = "portfolio-hover-content";
			hoverContent.innerHTML = "<i class='fa fa-plus fa-3x'></i>";
			hover.appendChild(hoverContent);
			var image = document.createElement("IMG");
			image.src = portfolios[i].srcImg;
			image.className = "img-responsive";
			image.alt = "";
			modal.appendChild(image);
			
			var caption = document.createElement("DIV");
			caption.className = "portfolio-caption";
			col.appendChild(caption);
			var captionHeader = document.createElement("H4");
			captionHeader.innerHTML = portfolios[i].captionHeader;
			caption.appendChild(captionHeader);
			var captionDesc = document.createElement("P");
			captionDesc.className = "text-muted";
			captionDesc.innerHTML = portfolios[i].captionDesc;
		}
	}; // portfolioRenderer


	this.aboutRenderer = function(params) {
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::aboutRenderer");
		var section = document.createElement("SECTION");
		section.id = "about";
//		section.className = "bg-light-gray";
		params.mainContainer.appendChild(section);

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
		heading.innerHTML = params.aboutWidget.heading;
		colHeading.appendChild(heading);
		
		var headingDesc = document.createElement("H3");
		headingDesc.className = "section-subheading text-muted";
		headingDesc.innerHTML = params.aboutWidget.headingDesc;
		colHeading.appendChild(headingDesc);
		
		var row2 = document.createElement("DIV");
		row2.className = "row";
		container.appendChild(row2);
		
		var col = document.createElement("DIV");
		col.className = "col-lg-12";
		row2.appendChild(col);
		
		var timeline = document.createElement("UL");
		timeline.className = "timeline";
		col.appendChild(timeline);
		
		var abouts = params.aboutWidget.abouts;
		for( i = 0; i < abouts.length; i++) {
			
			var li = document.createElement("LI");
			if (i % 2 == 1) {
				li.className = "timeline-inverted";
			}
			timeline.appendChild(li);
			
			var imageWrap = document.createElement("DIV");
			imageWrap.className = "timeline-image";
			li.appendChild(imageWrap);
			var image = document.createElement("IMG");
//			image.className = "img-circle img-responsive";
			image.className = "img-rounded img-responsive";
			image.src = abouts[i].srcImg;
			image.alt = abouts[i].alt;
			imageWrap.appendChild(image);
			
			var panel = document.createElement("DIV");
			panel.className = "timeline-panel";
			li.appendChild(panel);
			var headingWrap = document.createElement("DIV");
			headingWrap.className = "timeline-heading";
			panel.appendChild(headingWrap);
			var heading = document.createElement("H4");
			heading.innerHTML = abouts[i].heading;
			headingWrap.appendChild(heading);
			var headingDesc = document.createElement("H4");
			headingDesc.className = "subheading";
			headingDesc.innerHTML = abouts[i].headingDesc;
			headingWrap.appendChild(headingDesc);
			
			var contentWrap = document.createElement("DIV");
			contentWrap.className = "timeline-body";
			panel.appendChild(contentWrap);
			var content = document.createElement("P");
			content.className = "text-muted";
			content.innerHTML = abouts[i].content;
		
		}
		
		var finalLI = document.createElement("LI");
		if ( abouts.length % 2 == 1) {
			finalLI.className = "timeline-inverted";
		}
		timeline.appendChild(finalLI);
		var imageWrap = document.createElement("H4");
		imageWrap.innerHTML = "Be Part <br>Of Our <br>Story!";
		finalLI.appendChild(imageWrap);
		
	}; // aboutRenderer




	this.teamRenderer = function(params) {
		toastHub.logSystem.log("DEBUG","index::toastHubIndex::teamRenderer");
		var section = document.createElement("SECTION");
		section.id = "team";
		section.className = "bg-light-gray";
		params.mainContainer.appendChild(section);

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
//			col.className = "col-sm-4";
			col.className = "col-sm-6";
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
		final.innerHTML = "Contact Us!";
		colFinal.appendChild(final);
		
		
	}; // teamRenderer
	
	this.testParams = function(params) {
		params.portfolioWidget = {heading:"Portfolio",headingDesc:"Applications we are toasting!!",
				portfolios:[{modalLink:"#portfolioModal1",srcImg:"img/portfolio/cthreat.png",captionHeader:"C-THREAT App",captionDesc:"Mobile Development"},
				            {modalLink:"#portfolioModal2",srcImg:"img/portfolio/enterprise-framework.png",captionHeader:"Enterprise Framework",captionDesc:"Web Development"}]}
//				            {modalLink:"#portfolioModal3",srcImg:"img/portfolio/treehouse.png",captionHeader:"Treehouse",captionDesc:"Graphic Design"},
//				            {modalLink:"#portfolioModal4",srcImg:"img/portfolio/golden.png",captionHeader:"Golden",captionDesc:"Graphic Design"},
//				            {modalLink:"#portfolioModal5",srcImg:"img/portfolio/escape.png",captionHeader:"Escape",captionDesc:"Graphic Design"},
//				            {modalLink:"#portfolioModal6",srcImg:"img/portfolio/dreams.png",captionHeader:"Dreams",captionDesc:"Graphic Design"}]}
		params.aboutWidget = {heading:"About",headingDesc:"We love to develop",
				abouts:[{srcImg:"img/about/1.jpg",alt:"",heading:"November 2015",headingDesc:"Startup Weekend Champs!",content:"The team was formed"},
				        {srcImg:"img/about/2.jpg",alt:"",heading:"Febuary 2016",headingDesc:"Company is created",content:"CborgTech was assimilated"},
				        {srcImg:"img/about/3.jpg",alt:"",heading:"March 2016",headingDesc:"Open-Source Framework begins",content:"ToastHub is Core to CborgTech"},
				        {srcImg:"img/about/4.jpg",alt:"",heading:"April 2016",headingDesc:"C-THREAT MVP begins",content:"First Mobile App by CborgTech"}]}
		params.teamWidget = {heading:"Our Amazing Team",headingDesc:"Innovating Engineers",
				members:[{srcImg:"img/team/ed.jpg",alt:"",name:"Edward Seufert",title:"Java Guru"},
				         {srcImg:"img/team/hector.jpg",alt:"",name:"Hector Martinez",title:"User Experience Guru"}]}
		params.servicesWidget = [{cssPic:"fa-mobile",serviceHeading:"Mobile Apps",serviceDesc:"Bring your products and services to the hand of your customers"},
		                    {cssPic:"fa-laptop",serviceHeading:"Enterprise Web Apps",serviceDesc:"Responsive platform agnostic enterprise web applications"},
		                    {cssPic:"fa-cloud",serviceHeading:"Cloud Ready Architecture",serviceDesc:"Flexible and modular framework focused on what matters most to your customers"}];
		return params;
	}; // testParams
};