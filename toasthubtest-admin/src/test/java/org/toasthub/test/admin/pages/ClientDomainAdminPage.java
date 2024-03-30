package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class ClientDomainAdminPage {
	
	public static void gotoPage() {
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=clientDomain");
	}
	
	public static void create(String titleDefault, String titleEN, String titleES, String urlDomain, String appDomain,
			String appName, String prefix, String publicLayout, String adminLayout, String memberLayout, String sysadminLayout) {
		
		// open create modal
		Driver.findOrWaitById("clientDomain-menu").click();
		Driver.findOrWaitById("clientDomain-add").click();
		
		// fill form
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_TITLE_DEFAULT").sendKeys(titleDefault);
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT-es").sendKeys(titleES);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_URL_DOMAIN").sendKeys(urlDomain);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_APP_DOMAIN").sendKeys(appDomain);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_APP_NAME").sendKeys(appName);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_HTML_PREFIX").sendKeys(prefix);

		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_ACTIVE-0").findElement(By.xpath("..")).click();

		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_PUBLIC_LAYOUT").sendKeys(publicLayout);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_ADMIN_LAYOUT").sendKeys(adminLayout);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_MEMBER_LAYOUT").sendKeys(memberLayout);
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_SYSADMIN_LAYOUT").sendKeys(sysadminLayout);
		
		// save
		Driver.findOrWaitById("modalButtonAccept-clientDomainModal").click();
		
	}

	public static void modify(String search, String titleEN) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'sb')]").click();
		
		Driver.findOrWaitById("ADMIN_CLIENT_DOMAIN_FORM_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-clientDomainModal").click();
		
	}
	
	public static void delete(String search) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'db')]").click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	public static void search(String text) {
		// search
		Driver.findOrWaitById("clientDomainSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("clientDomainSearchField-button").click();
	}
	
	public static Boolean exists(String text) {
		return Driver.exists("//td[contains(text(),'"+text+"')]");
	}
	
}
