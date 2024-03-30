package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.ApplicationAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ApplicationTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		ApplicationAdminPage.gotoPage();
	}

	// create application
	@Test
	public void t2createApplicationTest(){
		ApplicationAdminPage.create("Pi Dragon", "Pi Dragon", "Pi Dragón", "PI_DRAGON");
		Assert.assertEquals(true,ApplicationAdminPage.exists("Pi Dragon"));
	}
	
	// modify application
	@Test
	public void t3modifyApplicationTest(){
		ApplicationAdminPage.modify("Pi Dragon", "Pi Dragon Modify");
		Assert.assertEquals(true,ApplicationAdminPage.exists("Pi Dragon Modify"));
	}
	
	// search for the new application
	@Test
	public void t4searchApplicationTest(){
		ApplicationAdminPage.search("Pi");
		Assert.assertEquals(true,ApplicationAdminPage.exists("Pi Dragon Modify"));
	}
	/*
	// create a duplicate application -- negative test
	@Test
	public void createApplicationTest(){
		ApplicationAdminPage.createApplication();
	}
	
	*/
	// delete the application
	@Test
	public void t5deleteApplicationTest(){
		ApplicationAdminPage.delete("Pi Dragon Modify");
		Driver.waitSeconds(1);
		Assert.assertEquals(false,ApplicationAdminPage.exists("Pi Dragon Modify"));
	}
}
