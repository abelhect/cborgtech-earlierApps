package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.UserAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UserTests extends BaseTests {

	@Test
	public void tAAinitTest(){
		LoginPage.login();
		UserAdminPage.gotoPage();
	}

	// create user
	@Test
	public void tABcreateUserTest(){
		UserAdminPage.create("LeRoy", "Theman", "Jenkins", "l.jenkins", "l.jenkins@ggg.com", "33344", "Spanish", "ljenkins@yyy.com", "DEBUG", true, false);
		Assert.assertEquals(true,UserAdminPage.exists("Jenkins"));
	}
	
	// modify user
	@Test
	public void tACmodifyUserTest(){
		UserAdminPage.modify("Jenkins", "JenkinsModify");
		Assert.assertEquals(true,UserAdminPage.exists("JenkinsModify"));
	}
	
	// search for the new user
	@Test
	public void tADsearchUserTest(){
		UserAdminPage.search("JenkinsModify");
		Assert.assertEquals(true,UserAdminPage.exists("JenkinsModify"));
	}

	// create a role
	@Test
	public void tAEaddRoleTest(){
		UserAdminPage.addRole("JenkinsModify","TestWidgetRole", "TestWidgetRole", "El Test widget role", "ROL_WIDGET_TEST", "Bugdog");
	}
	
	// select a role
	@Test
	public void tAFselectRoleTest(){
		UserAdminPage.selectRole("TestWidgetRole");
	}
	
	// create Permission
	@Test
	public void tAGaddPermissionTest(){
		UserAdminPage.addPermission("TestWidgetRole", "TestWidgetPermission", "TestWidgetPermission", "ElTest widget permission", "PRM_WIDGET_TEST", true, true, "Bugdog");
	}

	// select a permission
	@Test
	public void tAHselectPermissionTest(){
		UserAdminPage.selectPermission("TestWidgetPermission");
	}
	
	// unselect a permission
	@Test
	public void tAIunselectPermissionTest(){
		Driver.waitMilli(500);
		UserAdminPage.selectPermission("TestWidgetPermission");
	}
	
	@Test
	public void tAJdeletePermissionTest(){
		Driver.waitMilli(1000);
		UserAdminPage.deletePermission("TestWidgetPermission","TestWidgetRole");
	}
	
	// unselect a role
	@Test
	public void tAKunselectRoleTest(){
		Driver.waitMilli(500);
		UserAdminPage.selectRole("TestWidgetRole");
	}
	
	@Test
	public void tALdeleteRoleTest(){
		UserAdminPage.deleteRole("TestWidgetRole");
	}
	
	// delete the user
	@Test
	public void tAMdeleteUserTest(){
		Driver.waitSeconds(1);
		UserAdminPage.delete("JenkinsModify");
		Driver.waitSeconds(1);
		Assert.assertEquals(false,UserAdminPage.exists("JenkinsModify"));
	}
	
}
