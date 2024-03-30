package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.RoleAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class RoleTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		RoleAdminPage.gotoPage();
	}

	// create language
	@Test
	public void t2createRoleTest(){
		RoleAdminPage.create("TestRole", "TestRole", "El Test role", "ROL_TEST", "Bugdog");
		Assert.assertEquals(true,RoleAdminPage.exists("TestRole"));
	}
	
	// modify language
	@Test
	public void t3modifyRoleTest(){
		RoleAdminPage.modify("TestRole", "TestRoleModify");
		Assert.assertEquals(true,RoleAdminPage.exists("TestRoleModify"));
	}
	
	// search for the new language
	@Test
	public void t4searchRoleTest(){
		RoleAdminPage.search("TestRoleModify");
		Assert.assertEquals(true,RoleAdminPage.exists("TestRoleModify"));
	}
	/*
	// create a duplicate language -- negative test
	@Test
	public void createRoleTest(){
		RoleAdminPage.createRole();
		
	}
	
	*/
	// delete the language
	@Test
	public void t5deleteRoleTest(){
		RoleAdminPage.delete("TestRoleModify");
		Driver.waitSeconds(1);
		Assert.assertEquals(false,RoleAdminPage.exists("TestRoleModify"));
	}
}
