package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.LanguageAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class LanguageTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		LanguageAdminPage.gotoPage();
	}

	// create language
	@Test
	public void t2createLanguageTest(){
		LanguageAdminPage.create("German", "German", "Deutsche", "gr", "ltr");
		Assert.assertEquals(true,LanguageAdminPage.exists("German"));
	}
	
	// modify language
	@Test
	public void t3modifyLanguageTest(){
		LanguageAdminPage.modify("German", "GermanModify");
		Assert.assertEquals(true,LanguageAdminPage.exists("GermanModify"));
	}
	
	// search for the new language
	@Test
	public void t4searchLanguageTest(){
		LanguageAdminPage.search("GermanModify");
		Assert.assertEquals(true,LanguageAdminPage.exists("GermanModify"));
	}
	/*
	// create a duplicate language -- negative test
	@Test
	public void createLanguageTest(){
		LanguageAdminPage.createLanguage();
		
		
	}
	
	// delete default language -- negative test
	
	*/
	// delete the language
	@Test
	public void t5deleteLanguageTest(){
		LanguageAdminPage.delete("GermanModify");
		Driver.waitSeconds(1);
		Assert.assertEquals(false,LanguageAdminPage.exists("GermanModify"));
	}
}
