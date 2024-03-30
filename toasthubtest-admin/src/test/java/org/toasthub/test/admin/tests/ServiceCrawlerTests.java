package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.ServiceCrawlerAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ServiceCrawlerTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		ServiceCrawlerAdminPage.gotoPage();
	}

	// create service
	@Test
	public void t2createServiceTest(){
		ServiceCrawlerAdminPage.create("TEST_SVC_AUTO_TEST","1.0","1.0","org.toasthub.org","MEMBER");
		Driver.waitMilli(500);
		ServiceCrawlerAdminPage.search("TEST_SVC_AUTO_TEST");
		Assert.assertEquals(true,ServiceCrawlerAdminPage.exists("TEST_SVC_AUTO_TEST"));
	}
	
	// modify service
	@Test
	public void t3modifyServiceTest(){
		ServiceCrawlerAdminPage.modify("TEST_SVC_AUTO_TEST","org.toasthub.modify");
		Assert.assertEquals(true,ServiceCrawlerAdminPage.exists("TEST_SVC_AUTO_TEST"));
	}
	
	// search for the new service
	@Test
	public void t4searchServiceTest(){
		Driver.waitMilli(500);
		ServiceCrawlerAdminPage.search("TEST_SVC_AUTO_TEST");
		Assert.assertEquals(true,ServiceCrawlerAdminPage.exists("TEST_SVC_AUTO_TEST"));
	}
	/*
	// create a duplicate service -- negative test
	@Test
	public void createServiceTest(){
		ServiceCrawlerAdminPage.create();
	}
	
	*/
	// delete the service
	@Test
	public void t5deleteServiceTest(){
		Driver.waitMilli(500);
		ServiceCrawlerAdminPage.delete("TEST_SVC_AUTO_TEST");
		Driver.waitMilli(500);
		Assert.assertEquals(false,ServiceCrawlerAdminPage.exists("TEST_SVC_AUTO_TEST"));
	}
}
