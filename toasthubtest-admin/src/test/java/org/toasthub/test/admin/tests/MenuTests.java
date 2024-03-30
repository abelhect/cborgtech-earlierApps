package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.MenuAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MenuTests extends BaseTests {

	@Test
	public void tAAloginTest(){
		LoginPage.login();
		MenuAdminPage.gotoPage();
	}

	// create menu
	@Test
	public void tABcreateMenuTest(){
		MenuAdminPage.create("TEST_MENU_TEST","MenuTest","MenuTest","Menu test spanish","1.0","1.0");
		Assert.assertEquals(true,MenuAdminPage.exists("MenuTest"));
	}
	
	// modify menu
	@Test
	public void tACmodifyMenuTest(){
		MenuAdminPage.modify("MenuTest","MenuModify");
		Assert.assertEquals(true,MenuAdminPage.exists("MenuModify"));
	}
	
	// search for the menu
	@Test
	public void tADsearchMenuTest(){
		MenuAdminPage.search("MenuModify");
		Assert.assertEquals(true,MenuAdminPage.exists("MenuModify"));
	}
	
	// open collapse
	@Test
	public void tAEopenSubTest() {
		Driver.waitMilli(500);
		MenuAdminPage.openSub("MenuModify");
	}
	
	// create submenu
	@Test
	public void tBAcreateSubMenu(){
		Driver.waitMilli(500);
		MenuAdminPage.createSubMenu("TEST_SUB_MENU_TEST","SubMenuEN","SubMenuHrefEN","SubMenuImageEN","SubMenuES","SubMenuHrefES","SubMenuImageES");
		Assert.assertEquals(true,MenuAdminPage.exists("SubMenuEN"));
	}
	
	// modify submenu
	@Test
	public void tBBmodifySubMenu(){
		MenuAdminPage.modifySubMenu("SubMenuEN","SubMenuENModify");
		Assert.assertEquals(true,MenuAdminPage.exists("SubMenuENModify"));
	}
	
	// delete submenu
	@Test
	public void tBCdeleteSubMenu(){
		MenuAdminPage.deleteSubMenu("SubMenuENModify");
	}
	
	
	// create menuItem
	
	
	
	/*
	// create a duplicate menu -- negative test
	@Test
	public void createMenuTest(){
		MenuAdminPage.create();
		
		
	}
	
	
	*/
	// delete the menu
	@Test
	public void tZAdeleteMenuTest(){
		Driver.waitMilli(500);
		MenuAdminPage.delete("MenuModify");
		Driver.waitMilli(500);
		Assert.assertEquals(false,MenuAdminPage.exists("MenuModify"));
	}
}
