package org.toasthub.test.admin.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.toasthub.test.core.general.GeneralSettings;
import org.toasthub.test.core.selenium.Driver;

public class PreferenceAdminPage {
	
	private static Integer item = null;
	
	public static void gotoPage(){
		// got to page
		Driver.getInstance().get(GeneralSettings.hostWebContext+"/admin/index.html?page=prefPublic");
	}
	
	public static void create(String name, String defaultTitle, String titleEN, String titleES) {
		
		// open create modal
		Driver.findOrWaitById("pref-menu").click();
		Driver.findOrWaitById("pref-add").click();
		
		// fill form
		Driver.findOrWaitById("APP_PAGE_FORM_NAME").sendKeys(name);
		Driver.findOrWaitById("APP_PAGE_FORM_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_PAGE_FORM_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_PAGE_FORM_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_PAGE_FORM_ACTIVE-0").findElement(By.xpath("..")).click();
		// not testing this yet
		//Select dir = new Select(Driver.getInstance().findElement(By.id("APP_PAGE_FORM_CATEGORY")));
		//dir.selectByValue("PUBLIC");
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
		
	}

	public static void modify(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_page_menu-"+id).click();
		Driver.findOrWaitById("pref_page_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_PAGE_FORM_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
	}
	
	public static void delete(String name) {
	
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_page_menu-"+id).click();
		Driver.findOrWaitById("pref_page_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
		
	}
	
	public static void search(String text) {
		// search
		Driver.findOrWaitById("preferenceSearchField").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), text);
		Driver.findOrWaitById("preferenceSearchField-button").click();
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
	
	// Formfield
	public static void createFormfield(String name, String defaultTitle, String titleEN, String titleES, String fieldType, String group,
			String labelEN, String labelES) {
		// go to tab
		Driver.findOrWaitById("tab_formfield-"+item).click();
		// open menu
		Driver.findOrWaitById("pref_formfield_main_menu-"+item).click();
		// create modal
		Driver.findOrWaitById("pref_formfield_main_create-"+item).click();
		
		// fill form
		Driver.findOrWaitById("APP_FORMFIELD_NAME_NAME").sendKeys(name);
		Driver.findOrWaitById("APP_FORMFIELD_NAME_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_FORMFIELD_NAME_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_FORMFIELD_NAME_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_FORMFIELD_NAME_ACTIVE-0").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_FORMFIELD_NAME_FIELDTYPE").sendKeys(fieldType);
		Driver.findOrWaitById("APP_FORMFIELD_NAME_GROUP").sendKeys(group);		

		Driver.findOrWaitById("APP_FORMFIELD_VALUE_LABEL-en").sendKeys(labelEN);
		Driver.findOrWaitById("APP_FORMFIELD_VALUE_RENDERED-0-en").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_FORMFIELD_VALUE_REQUIRED-0-en").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_FORMFIELD_VALUE_LABEL-es").sendKeys(labelES);
		Driver.findOrWaitById("APP_FORMFIELD_VALUE_RENDERED-0-es").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_FORMFIELD_VALUE_REQUIRED-0-es").findElement(By.xpath("..")).click();
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
				
	}
	
	public static void modifyFormfield(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_formfield_menu-"+id).click();
		Driver.findOrWaitById("pref_formfield_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_FORMFIELD_NAME_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
	}
	
	public static void deleteFormfield(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_formfield_menu-"+id).click();
		Driver.findOrWaitById("pref_formfield_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	// Label 
	public static void createLabel(String name, String defaultTitle, String titleEN, String titleES, String options, String labelEN, String labelES) {
		// go to tab
		Driver.findOrWaitById("tab_label-"+item).click();
		// open menu
		Driver.findOrWaitById("pref_label_main_menu-"+item).click();
		// crate modal
		Driver.findOrWaitById("pref_label_main_create-"+item).click();

		// fill form
		Driver.findOrWaitById("APP_LABEL_NAME_NAME").sendKeys(name);
		Driver.findOrWaitById("APP_LABEL_NAME_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_LABEL_NAME_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_LABEL_NAME_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_LABEL_NAME_ACTIVE-0").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_LABEL_NAME_OPTIONALPARAMS").sendKeys(options);	

		Driver.findOrWaitById("APP_LABEL_VALUE_VALUE-en").sendKeys(labelEN);
		Driver.findOrWaitById("APP_LABEL_VALUE_RENDERED-0-en").findElement(By.xpath("..")).click();

		Driver.findOrWaitById("APP_LABEL_VALUE_VALUE-es").sendKeys(labelES);
		Driver.findOrWaitById("APP_LABEL_VALUE_RENDERED-0-es").findElement(By.xpath("..")).click();
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
				
	}
	
	public static void modifyLabel(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_label_menu-"+id).click();
		Driver.findOrWaitById("pref_label_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_LABEL_NAME_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
	}
	
	public static void deleteLabel(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_label_menu-"+id).click();
		Driver.findOrWaitById("pref_label_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	
	// Text
	public static void createText(String name, String defaultTitle, String titleEN, String titleES, String options,
			String valueEN, String valueES) {
		// go to tab
		Driver.findOrWaitById("tab_text-"+item).click();
		// open menu
		Driver.findOrWaitById("pref_text_main_menu-"+item).click();
		// create modal
		Driver.findOrWaitById("pref_text_main_create-"+item).click();
		
		// fill form
		Driver.findOrWaitById("APP_TEXT_NAME_NAME").sendKeys(name);
		Driver.findOrWaitById("APP_TEXT_NAME_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_TEXT_NAME_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_TEXT_NAME_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_TEXT_NAME_ACTIVE-0").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_TEXT_NAME_OPTIONALPARAMS").sendKeys(options);		

		Driver.findOrWaitById("APP_TEXT_VALUE_VALUE-en").sendKeys(valueEN);
		Driver.findOrWaitById("APP_TEXT_VALUE_RENDERED-0-en").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_TEXT_VALUE_VALUE-es").sendKeys(valueES);
		Driver.findOrWaitById("APP_TEXT_VALUE_RENDERED-0-es").findElement(By.xpath("..")).click();
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
				
	}
	
	public static void modifyText(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_text_menu-"+id).click();
		Driver.findOrWaitById("pref_text_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_TEXT_NAME_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
	}
	
	public static void deleteText(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_text_menu-"+id).click();
		Driver.findOrWaitById("pref_text_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
	
	// Option
	public static void createOption(String name, String defaultTitle, String titleEN, String titleES, String valueType, String defaultValue,
			String options, String valueEN, String validationEN, String valueES, String validationES) {
		// go to tab
		Driver.findOrWaitById("tab_option-"+item).click();
		// open menu
		Driver.findOrWaitById("pref_option_main_menu-"+item).click();
		// create modal
		Driver.findOrWaitById("pref_option_main_create-"+item).click();

		// fill form
		Driver.findOrWaitById("APP_OPTION_NAME_NAME").sendKeys(name);
		Driver.findOrWaitById("APP_OPTION_NAME_TITLE_DEFAULT").sendKeys(defaultTitle);
		Driver.findOrWaitById("APP_OPTION_NAME_TITLE_TEXT-en").sendKeys(titleEN);
		Driver.findOrWaitById("APP_OPTION_NAME_TITLE_TEXT-es").sendKeys(titleES);
		Driver.findOrWaitById("APP_OPTION_NAME_ACTIVE-0").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_OPTION_NAME_VALUETYPE").sendKeys(valueType);
		Driver.findOrWaitById("APP_OPTION_NAME_DEFAULTVALUE").sendKeys(defaultValue);		
		Driver.findOrWaitById("APP_OPTION_NAME_USEDEFAULT-1").findElement(By.xpath("..")).click();
		Driver.findOrWaitById("APP_OPTION_NAME_OPTIONALPARAMS").sendKeys(options);
		
		Driver.findOrWaitById("APP_OPTION_VALUE_VALUE-en").sendKeys(valueEN);
		Driver.findOrWaitById("APP_OPTION_VALUE_VALIDATION-en").sendKeys(validationEN);
		Driver.findOrWaitById("APP_OPTION_VALUE_RENDERED-0-en").findElement(By.xpath("..")).click();
		
		Driver.findOrWaitById("APP_OPTION_VALUE_VALUE-es").sendKeys(valueES);
		Driver.findOrWaitById("APP_OPTION_VALUE_VALIDATION-es").sendKeys(validationES);
		Driver.findOrWaitById("APP_OPTION_VALUE_RENDERED-0-es").findElement(By.xpath("..")).click();
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
				
	}
	
	public static void modifyOption(String name, String titleEN) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_option_menu-"+id).click();
		Driver.findOrWaitById("pref_option_modify-"+id).click();
		
		// open modify modal
		Driver.findOrWaitById("APP_OPTION_NAME_TITLE_TEXT-en").sendKeys(Keys.HOME,Keys.chord(Keys.SHIFT,Keys.END), titleEN);
		// save
		Driver.findOrWaitById("modalButtonAccept-prefsModal").click();
	}
	
	public static void deleteOption(String name) {
		WebElement m = Driver.findOrWaitByXPath("//h2/a[contains(text(),'"+name+"')]");
		String[] href = m.getAttribute("href").split("-");
		int id = Integer.parseInt(href[1]);
		Driver.findOrWaitById("pref_option_menu-"+id).click();
		Driver.findOrWaitById("pref_option_delete-"+id).click();
		
		// acknowledge
		Driver.findOrWaitById("modalButtonAccept-acknowledgeModal").click();
	}
}
