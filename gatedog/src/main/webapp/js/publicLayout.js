/**
 * @author Edward H. Seufert
 * Copyright (C) 2016 CBorgTech
 *
 */

publicLayout.prototype = Object.create(toastHubBase.prototype);
publicLayout.prototype.constructor = publicLayout;

toastHub.registerLayout("publicLayout",new publicLayout());

function publicLayout(instanceName){
	toastHubBase.call(this,instanceName,this);
	this.ajaxFunc = "public";
	this.service = "PUBLIC_SVC";
	this.TAG = "publicLayout::";
	this.cssMapLoadOrder = ["THEME"];
	this.cssMap = {
			"THEME":"css/agency.min.css",
			"SITE":"css/site.css"};
	var self = this;
	
	this.initPage = function(params) {
		toastHub.logSystem.log("DEBUG",this.TAG+"initPage");
		// load local css
		var cssMapLength = this.cssMapLoadOrder.length;
		for (var i = 0; i < cssMapLength; i++) {
			var href = this.cssMap[this.cssMapLoadOrder[i]];
			if (href.indexOf("http") == -1){
				href = toastHub.basePath.concat(this.cssMap[this.cssMapLoadOrder[i]]);
			}
			toastHub.logSystem.log("TRACE",this.TAG+"loading css " + href);
			if (fileExists(href)) {
				//document.write('<link rel="stylesheet" type="text/css" href="'+href+'" />');
				var link = document.createElement("LINK");
				link.type = "text/css";
				link.rel = "stylesheet"
				link.href = href;
				document.getElementsByTagName("head")[0].appendChild(link);
			}
		}
		// add menu
		this.navRenderer();
		
		// add content
		toastHub.getController(toastHub.pageName).initContent(params);
		
		// add footer
		this.footerRenderer(params);
		
		this.addAction();
	}; // initPage
	
	
	this.navRenderer = function(params){
		toastHub.logSystem.log("DEBUG",this.TAG+"navRenderer");
		//var callUrl = toastHub.restUrl + this.ajaxFunc + "/callService";
		var nav = document.createElement("NAV");
		nav.id = "mainNav";
		nav.className = "navbar navbar-default navbar-custom navbar-fixed-top affix";
		toastHub.containerMenuObj = nav;
		toastHub.body.appendChild(nav);
		var params = toastHub.initParams();
		params.action = "INIT_MENU";
		params.service = "PUBLIC_SVC";
		params.menuNames = new Array("CTHREAT_PUBLIC_MENU_RIGHT");
		params.callBack = function(JSONData){self.navRendererDraw(JSONData);};
		this.callService(params);
	}; // navRenderer
	
	this.navRendererDraw = function(JSONData) {
		toastHub.logSystem.log("DEBUG",this.TAG+"navRendererDraw");
		var menuRight = JSONData.params.MENUS.CTHREAT_PUBLIC_MENU_RIGHT;
		
		var nav = document.getElementById("mainNav")
		
		var navWrap = document.createElement("DIV");
		navWrap.className = "container";
		nav.appendChild(navWrap);
		var navHeader = document.createElement("DIV");
		navHeader.className = "navbar-header page-scroll";
		navWrap.appendChild(navHeader);
		var buttonToggle = document.createElement("BUTTON");
		buttonToggle.type = "button";
		buttonToggle.className = "navbar-toggle";
		buttonToggle.setAttribute("data-toggle", "collapse");
		buttonToggle.setAttribute("data-target", "#bs-example-navbar-collapse-1");
		
		buttonToggle.innerHTML = "<span class='sr-only'>Toggle navigation</span> Menu <i class='fa fa-bars'></i>"
		navHeader.appendChild(buttonToggle);
		var logo = document.createElement("A");
		logo.className = "navbar-brand page-scroll";
		logo.href = "#page-top";
		logo.innerHTML = "GateDog";
		navHeader.appendChild(logo);
		
		
		var menu = document.createElement("DIV");
		menu.className = "collapse navbar-collapse";
		menu.id = "bs-example-navbar-collapse-1";
		navWrap.appendChild(menu);
		var menuUL = document.createElement("UL");
		menuUL.className = "nav navbar-nav navbar-right";
		menu.appendChild(menuUL);
		
		for (var i in menuRight){
			if (menuRight.hasOwnProperty(i)){
				var menuLI = document.createElement("li");
				menuUL.appendChild(menuLI);
				var menuHref = document.createElement("a");
				menuHref.className = 'page-scroll';
				
				menuHref.href = "/"+toastHub.contextPath+menuRight[i].values[0].href;
				menuHref.innerHTML = menuRight[i].values[0].value;
				menuLI.appendChild(menuHref);
				if (menuRight[i].children != null){
					var menuSub = document.createElement("ul");
					menuSub.className = "sub";
					this.addSubMenu(menuSub,menuRight[i].children);
					menuLI.appendChild(menuSub);
				}
			}
		}

	}; // navRendererDraw
	
	this.footerRenderer = function(params){
		toastHub.logSystem.log("DEBUG",this.TAG+"footerRenderer");
		var footer = document.createElement("FOOTER");
		toastHub.body.appendChild(footer);
		
		var container = document.createElement("DIV");
		container.className = "row";
		footer.appendChild(container);
		
		var col1 = document.createElement("DIV");
		col1.className = "col-md-4";
			var copyright = document.createElement("SPAN");
			copyright.className = "copyright";
			copyright.innerHTML = "Copyright &copy; ToastHub 2016";
			col1.appendChild(copyright);
		container.appendChild(col1);
		
		var col2 = document.createElement("DIV");
		col2.className = "col-md-4";
			var ul1 = document.createElement("UL");
			ul1.className = "list-inline social-buttons";
			col2.appendChild(ul1);
			var li1 = document.createElement("LI");
			li1.innerHTML = "<a href='#'><i class='fa fa-twitter'></i></a>";
			ul1.appendChild(li1);
			var li2 = document.createElement("LI");
			li2.innerHTML = "<a href='#'><i class='fa fa-facebook'></i></a>";
			ul1.appendChild(li2);
			var li3 = document.createElement("LI");
			li3.innerHTML = "<a href='#'><i class='fa fa-linkedin'></i></a>";
			ul1.appendChild(li3);
		container.appendChild(col2);
			
		var col3 = document.createElement("DIV");
		col3.className = "col-md-4";
			var ul2 = document.createElement("UL");
			ul2.className = "list-inline quicklinks";
			col3.appendChild(ul2);
			var li31 = document.createElement("LI");
			li31.innerHTML = "<a href='#'>Privacy Policy</a>";
			ul2.appendChild(li31);
			var li32 = document.createElement("LI");
			li32.innerHTML = "<a href='#'>Terms of Use</a>";
			ul2.appendChild(li32);
		container.appendChild(col3);	

	}; // footerRenderer
	
	this.addAction = function() {
		
		jQuery('a.page-scroll').bind('click', function(event) {
	        var $anchor = $(this);
	        jQuery('html, body').stop().animate({
	            scrollTop: ($($anchor.attr('href')).offset().top - 50)
	        }, 1250, 'easeInOutExpo');
	        event.preventDefault();
	    });

	    // Highlight the top nav as scrolling occurs
	    jQuery('body').scrollspy({
	        target: '.navbar-fixed-top',
	        offset: 51
	    });

	    // Closes the Responsive Menu on Menu Item Click
	    jQuery('.navbar-collapse ul li a').click(function(){ 
	            jQuery('.navbar-toggle:visible').click();
	    });

	    // Offset for Main Navigation
	    jQuery('#mainNav').affix({
	        offset: {
	            top: 100
	        }
	    });
	}; // addAction
	
}; // toastHubDefaultLayout




