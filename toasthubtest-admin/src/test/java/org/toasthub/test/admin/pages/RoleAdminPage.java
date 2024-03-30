package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class RoleAdminPage {
	
	public static void gotoPage() {
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=roles");
	}
	
	public static void create(String titleDefault, String titleEN, String titleES, String code, String application) {
		
		// open create modal
		Driver.findOrWaitById("roles-menu").click();
		Driver.findOrWaitById("roles-add").click();
		
		// fill form
		Driver.findOrWaitById("ADMIN_ROLE_FORM_TITLE_DEFAULT").sendKeys(titleDefault);
		Driver.findOrWaitById("ADMIN_ROLE_FORM_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("ADMIN_ROLE_FORM_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("ADMIN_ROLE_FORM_CODE").sendKeys(code);
		Driver.findOrWaitById("ADMIN_ROLE_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		
		// select application
		Driver.findOrWaitById("ADMIN_ROLE_FORM_APPLICATION-button").click();
		Driver.waitMilli(500);
		Driver.findOrWaitByXPath("//td[contains(text(),'"+application+"')]/preceding-sibling::td/div/input[contains(@id,'cboxapplication')]").click();
		Driver.findOrWaitById("modalButtonAccept-applicationWidgetModal").click();
		Driver.waitMilli(500);
		// save
		Driver.findOrWaitById("modalButtonAccept-rolesModal").click();
		
	}

	public static void modify(String search, String titleEN) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'sb')]").click();
		Driver.findOrWaitById("ADMIN_ROLE_FORM_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-rolesModal").click();
		
	}
	
	public static void delete(String search) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'db')]").click();
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	public static void search(String text) {
		
		// search
		Driver.findOrWaitById("rolesSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("rolesSearchField-button").click();
	}
	
	public static Boolean exists(String text) {
		return Driver.exists("//td[contains(text(),'"+text+"')]");
	}
	
}
