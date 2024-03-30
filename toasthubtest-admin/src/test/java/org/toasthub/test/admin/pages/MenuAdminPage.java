package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class MenuAdminPage {
	
	private static Integer item = null;
	
	public static void gotoPage(){
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=menuPublic");
	}
	
	public static void create(String name, String defaultTitle, String titleEN, String titleES, String apiVersion, String appVersion) {
		
		// open create modal
		Driver.findOrWaitById("menu-menu").click();

		Driver.findOrWaitById("menu-add").click();
		
		// fill form
		Driver.findOrWaitById("APP_MENU_FORM_CODE").sendKeys(name);
		Driver.findOrWaitById("APP_MENU_FORM_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_MENU_FORM_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_MENU_FORM_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_MENU_FORM_APIVERSION").sendKeys(apiVersion);
		Driver.findOrWaitById("APP_MENU_FORM_APPVERSION").sendKeys(appVersion);
		Select dir = new Select(Driver.findOrWaitById("APP_MENU_FORM_CATEGORY"));
		Driver.findOrWaitById("APP_MENU_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		dir.selectByValue("PUBLIC");
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
		
	}

	public static void modify(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_item_menu-"+id).click();
		Driver.findOrWaitById("menu_item_modify-"+id).click();

		Driver.findOrWaitById("APP_MENU_FORM_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
		
	}
	
	public static void delete(String name) {
		
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_item_menu-"+id).click();
		Driver.findOrWaitById("menu_item_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
		
	}
	
	public static void search(String text) {
		// search
		Driver.findOrWaitById("menuSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("menuSearchField-button").click();
	}
	
	public static Boolean exists(String name) {
		return Driver.exists("//h2/a[contains(text(),'"+name+"')]");
	}
	
	public static void openSub(String name){
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		item = Integer.parseInt(href[1]);
		// open menu  
		m.click();
	}
	
	// SubMenu
	public static void createSubMenu(String name, String valueEN, String hrefEN, String imageEN, String valueES, String hrefES, String imageES) {
		// open menu
		Driver.findOrWaitById("menu_item_main_menu-"+item).click();
		// create modal
		Driver.findOrWaitById("menu_item_main_create-"+item).click();
		
		// fill form
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_CODE").sendKeys(name);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-en").sendKeys(valueEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_HREF-en").sendKeys(hrefEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_IMAGE-en").sendKeys(imageEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_RENDERED-0-en").findElement(By.xpath("..")).click();
		
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-es").sendKeys(valueES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_HREF-es").sendKeys(hrefES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_IMAGE-es").sendKeys(imageES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_RENDERED-0-es").findElement(By.xpath("..")).click();
		
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
				
	}
	
	public static void modifySubMenu(String name, String valueEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_subItem_menu-"+id).click();
		Driver.findOrWaitById("menu_subItem_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), valueEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
	}
	
	public static void deleteSubMenu(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_subItem_menu-"+id).click();
		Driver.findOrWaitById("menu_subItem_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	// menu SubItem
	public static void createSubItemMenu(String name, String valueEN, String hrefEN, String imageEN, String valueES, String hrefES, String imageES) {
		// open menu
		Driver.findOrWaitById("menu_subItem_main_menu-"+item).click();
		// create modal
		Driver.findOrWaitById("menu_subItem_main_create-"+item).click();
		
		// fill form
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_CODE").sendKeys(name);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-en").sendKeys(valueEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_HREF-en").sendKeys(hrefEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_IMAGE-en").sendKeys(imageEN);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_RENDERED-0-en").findElement(By.xpath("..")).click();
		
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-es").sendKeys(valueES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_HREF-es").sendKeys(hrefES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_IMAGE-es").sendKeys(imageES);
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_RENDERED-0-es").findElement(By.xpath("..")).click();
		
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
				
	}
	
	public static void modifySubItemMenu(String name, String valueEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_subItem_menu-"+id).click();
		Driver.findOrWaitById("menu_subItem_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_MENU_ITEM_FORM_VALUE-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), valueEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-menuModal").click();
	}
	
	public static void deleteSubItemMenu(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("menu_subItem_menu-"+id).click();
		Driver.findOrWaitById("menu_subItem_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
}
