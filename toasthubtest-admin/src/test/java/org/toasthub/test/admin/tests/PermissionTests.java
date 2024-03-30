package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.PermissionAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PermissionTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		PermissionAdminPage.gotoPage();
	}

	// create Permission
	@Test
	public void t2createPermissionTest(){
		PermissionAdminPage.create("TestPermission", "TestPermission", "ElTest", "PRM_TEST", true, true, "Bugdog");
		Assert.assertEquals(true,PermissionAdminPage.exists("TestPermission"));
	}
	
	// modify Permission
	@Test
	public void t3modifyPermissionTest(){
		PermissionAdminPage.modify("TestPermission", "TestPermissionModify");
		Assert.assertEquals(true,PermissionAdminPage.exists("TestPermissionModify"));
	}
	
	// search for the new Permission
	@Test
	public void t4searchPermissionTest(){
		PermissionAdminPage.search("TestPermissionModify");
		Assert.assertEquals(true,PermissionAdminPage.exists("TestPermissionModify"));
	}
	/*
	// create a duplicate Permission -- negative test
	@Test
	public void createPermissionTest(){
		PermissionAdminPage.createPermission();
	
	}
	
	// delete default Permission -- negative test
	
	*/
	// delete the Permission
	@Test
	public void t5deletePermissionTest(){
		
		PermissionAdminPage.delete("TestPermissionModify");
		Driver.waitMilli(500);
		Assert.assertEquals(false,PermissionAdminPage.exists("TestPermissionModify"));
	}
}
