package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.ui.Select;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class UserAdminPage {
	
	public static void gotoPage() {
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=users");
	}
	
	public static void create(String firstName, String middleName, String lastName, String userName, String email, String zipCode, 
			String language, String alternateEmail, String logLevel, Boolean status, Boolean forcePassReset) {
		
		// open create modal
		Driver.findOrWaitById("users-menu").click();
		Driver.findOrWaitById("users-add").click();

		// fill form
		Driver.findOrWaitById("ADMIN_USER_FORM_FIRSTNAME").sendKeys(firstName);
		Driver.findOrWaitById("ADMIN_USER_FORM_MIDDLENAME").sendKeys(middleName);
		Driver.findOrWaitById("ADMIN_USER_FORM_LASTNAME").sendKeys(lastName);
		Driver.findOrWaitById("ADMIN_USER_FORM_USERNAME").sendKeys(userName);
		Driver.findOrWaitById("ADMIN_USER_FORM_EMAIL").sendKeys(email);
		Driver.findOrWaitById("ADMIN_USER_FORM_ZIPCODE").sendKeys(zipCode);
		
		// select language
		Driver.findOrWaitById("ADMIN_USER_FORM_LANGUAGE-button").click();
		Driver.waitMilli(500);
		Driver.findOrWaitByXPath("//td[contains(text(),'"+language+"')]/preceding-sibling::td/div/input[contains(@id,'cboxlanguage')]").click();
		Driver.findOrWaitById("modalButtonAccept-languageWidgetModal").click();
		Driver.waitMilli(500);
				
		Driver.findOrWaitById("ADMIN_USER_FORM_ALTERNATE_EMAIL").sendKeys(alternateEmail);
		
		Select level = new Select(Driver.findOrWaitById("ADMIN_USER_FORM_LOGLEVEL"));
		level.selectByValue(logLevel);
		
		Driver.findOrWaitById("ADMIN_USER_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("ADMIN_USER_FORM_FORCERESET-0").findElement(By.xpath("..")).click();
		
		// save
		Driver.findOrWaitById("modalButtonAccept-usersModal").click();
		
	}

	public static void modify(String search, String lastName) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'sb')]").click();
		Driver.findOrWaitById("ADMIN_USER_FORM_LASTNAME").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), lastName);
		// save
		Driver.findOrWaitById("modalButtonAccept-usersModal").click();
		
	}
	
	public static void addRole(String userName, String titleDefault, String titleEN, String titleES, String code, String application) {

		Driver.findOrWaitByXPath("//td[contains(text(),'"+userName+"')]/following-sibling::td/span/a[contains(@id,'rls')]").click();
		RoleAdminPage.create(titleDefault, titleEN, titleES, code, application);
		
		Driver.findOrWaitByXPath("//td[contains(text(),'"+titleEN+"')]");
		//Driver.findOrWaitById("modalButtonDecline-rolesWidgetModal").click();
	}
	
	public static void selectRole(String role) {
		Driver.findOrWaitByXPath("//td[contains(text(),'"+role+"')]/preceding-sibling::td/div/input[contains(@id,'cboxrole')]").click();
		Driver.findOrWaitByXPath("//div[@id='rolesMessageArea']/div[contains(text(),'Success')]");
	}
	
	public static void deleteRole(String role){
		Driver.waitMilli(500);
		Driver.findOrWaitByXPath("//td[contains(text(),'"+role+"')]/following-sibling::td/span/a[contains(@id,'db')]").click();
		// acknowledge
		Driver.waitMilli(500);
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
		Driver.waitMilli(500);
		
		Driver.findOrWaitById("modalButtonDecline-rolesWidgetModal").click();
	}
	
	public static void addPermission(String role, String titleDefault, String titleEN, String titleES, String code, Boolean read, Boolean write, String application) {

		Driver.findOrWaitByXPath("//td[contains(text(),'"+role+"')]/following-sibling::td/span/a[contains(@id,'prm')]").click();
		PermissionAdminPage.create(titleDefault, titleEN, titleES, code, read, write, application);
		
		Driver.findOrWaitByXPath("//td[contains(text(),'"+titleEN+"')]");
	}
	
	public static void selectPermission(String permission){
		Driver.findOrWaitByXPath("//td[contains(text(),'"+permission+"')]/preceding-sibling::td/div/input[contains(@id,'cboxpermission')]").click();
		Driver.findOrWaitByXPath("//div[@id='permissionsMessageArea']/div[contains(text(),'Success')]");
	}
	
	public static void deletePermission(String permission,String role){
		Driver.findOrWaitById("modalButtonDecline-permissionsWidgetModal").click();
		Driver.waitMilli(500);
		Driver.findOrWaitByXPath("//td[contains(text(),'"+role+"')]/following-sibling::td/span/a[contains(@id,'prm')]").click();
		Driver.waitMilli(1000);
		Driver.findOrWaitByXPath("//td[contains(text(),'"+permission+"')]/following-sibling::td/span/a[contains(@id,'dbprm')]").click();
		Driver.waitMilli(1000);
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
		
		Driver.waitMilli(500);
		Driver.findOrWaitById("modalButtonDecline-permissionsWidgetModal").click();
		
	}
	
	public static void delete(String search) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+search+"')]/following-sibling::td/span/a[contains(@id,'db')]").click();
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	public static void search(String text) {
		
		// search
		Driver.findOrWaitById("userSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("userSearchField-button").click();
	}
	
	public static Boolean exists(String text) {
		return Driver.exists("//td[contains(text(),'"+text+"')]");
	}
	
}
