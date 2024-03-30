package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.support.ui.Select;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class ServiceCrawlerAdminPage {
	
	public static void gotoPage() {
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=service");
	}
	
	public static void create(String name, String api, String app, String className, String category) {
		
		// open create modal
		Driver.findOrWaitById("serviceCrawler-menu").click();
		Driver.findOrWaitById("serviceCrawler-add").click();
		
		// fill form
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_SERVICE_NAME").sendKeys(name);
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_API_VERSION").sendKeys(api);
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_APP_VERSION").sendKeys(app);
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_CLASS_NAME").sendKeys(className);
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		// not testing this yet
		//Driver.getInstance().findElement(By.id("radio-ADMIN_LANGUAGE_FORM_DEFAULT"));
		Select dir = new Select(Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_CATEGORY"));
		dir.selectByValue(category);
		// save
		Driver.findOrWaitById("modalButtonAccept-serviceCrawlerModal").click();
		
	}

	public static void modify(String name, String className) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+name+"')]/following-sibling::td/span/a[contains(@id,'sb')]").click();
		Driver.findOrWaitById("ADMIN_SERVICE_CRAWLER_FORM_CLASS_NAME").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), className);
		// save
		Driver.findOrWaitById("modalButtonAccept-serviceCrawlerModal").click();
		
	}
	
	public static void delete(String name) {
		
		// find test row ?
		Driver.findOrWaitByXPath("//td[contains(text(),'"+name+"')]/following-sibling::td/span/a[contains(@id,'db')]").click();
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
		
	}
	
	public static void search(String text) {
		
		// search
		Driver.findOrWaitById("serviceCrawlerSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("serviceCrawlerSearchField-button").click();
	}
	
	public static Boolean exists(String text) {
		return Driver.exists("//td[contains(text(),'"+text+"')]");
	}
	
}
