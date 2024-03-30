package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.ClientDomainAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ClientDomainTests extends BaseTests {

	@Test
	public void t1initTest(){
		LoginPage.login();
		ClientDomainAdminPage.gotoPage();
	}

	// create clientDomain
	@Test
	public void t2createClientDomainTest(){
		ClientDomainAdminPage.create("Test System", "Test System", "Sistema de prueba", "cborgtech.ddns.net", "toasthub1", "cborgcust", "cborgcust",
				"publicLayout", "adminLayout", "memberLayout", "sysadminLayout");
		Assert.assertEquals(true,ClientDomainAdminPage.exists("Test System"));
	}
	
	// modify clientDomain
	@Test
	public void t3modifyClientDomainTest(){
		ClientDomainAdminPage.modify("Test System", "TestSystemModify");
		Assert.assertEquals(true,ClientDomainAdminPage.exists("TestSystemModify"));
	}
	
	// search for the new clientDomain
	@Test
	public void t4searchClientDomainTest(){
		Driver.waitMilli(500);
		ClientDomainAdminPage.search("TestSystemModify");
		Assert.assertEquals(true,ClientDomainAdminPage.exists("TestSystemModify"));
	}
	/*
	// create a duplicate clientDomain -- negative test
	@Test
	public void createClientDomainTest(){
		ClientDomainAdminPage.createClientDomain();
	}
	
	// delete default clientDomain -- negative test
	
	*/
	// delete the clientDomain
	@Test
	public void t5deleteClientDomainTest(){
		ClientDomainAdminPage.delete("TestSystemModify");
		Driver.waitSeconds(1);
		Assert.assertEquals(false,ClientDomainAdminPage.exists("TestSystemModify"));
	}
}
