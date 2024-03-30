package org.toasthub.test.admin.tests;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;
import org.junit.Test;
import org.toasthub.test.admin.pages.PreferenceAdminPage;
import org.toasthub.test.core.general.BaseTests;
import org.toasthub.test.core.pages.login.LoginPage;
import org.toasthub.test.core.selenium.Driver;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PreferenceTests extends BaseTests {

	@Test
	public void tAAloginTest(){
		LoginPage.login();
		PreferenceAdminPage.gotoPage();
	}

	// create preference
	@Test
	public void tABcreatePreferenceTest(){
		PreferenceAdminPage.create("TEST_PAGE_NAME_TEST","PrefTest","PrefTest","Pref test spanish");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefTest"));
	}
	
	// modify preference
	@Test
	public void tACmodifyPreferenceTest(){
		PreferenceAdminPage.modify("PrefTest","PrefModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefModify"));
	}
	
	// search for the new preference
	@Test
	public void tADsearchPreferenceTest(){
		Driver.waitMilli(500);
		PreferenceAdminPage.search("PrefModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefModify"));
	}
	
	// open collapse
	@Test
	public void tAEopenSubTest() {
		Driver.waitMilli(500);
		PreferenceAdminPage.openSub("PrefModify");
	}
	
	// create formfield
	@Test
	public void tBAcreateFormField(){
		PreferenceAdminPage.createFormfield("TEST_FORMFIELD_NAME_TEST","PrefForm","PrefForm","Pref form spanish","String","MAIN","labelen","labeles");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefForm"));
	}
	
	// modify formfield
	@Test
	public void tBBmodifyFormField(){
		PreferenceAdminPage.modifyFormfield("PrefForm","PrefFormModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefFormModify"));
	}
	
	// delete formfield
	@Test
	public void tBCdeleteFormField(){
		PreferenceAdminPage.deleteFormfield("PrefFormModify");
	}
		
	// create label
	@Test
	public void tCAcreateLabel(){
		Driver.waitMilli(500);
		PreferenceAdminPage.createLabel("TEST_LABEL_NAME_TEST","PrefLabel","PrefLabel","Pref label spanish","","labelen","labeles");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefLabel"));
	}
	
	// modify label
	@Test
	public void tCBmodifyLabel(){
		PreferenceAdminPage.modifyLabel("PrefLabel","PrefLabelModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefLabelModify"));
	}
	
	// delete label
	@Test
	public void tCCdeleteLabel(){
		PreferenceAdminPage.deleteLabel("PrefLabelModify");
	}
		
	// create text
	@Test
	public void tDAcreateText(){
		Driver.waitMilli(500);
		PreferenceAdminPage.createText("TEST_TEXT_NAME_TEST","PrefText","PrefText","Pref text spanish","","valueen","valuees");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefText"));
	}
	
	// modify text
	@Test
	public void tDBmodifyText(){
		PreferenceAdminPage.modifyText("PrefText","PrefTextModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefTextModify"));
	}
	
	// delete text
	@Test
	public void tDCdeleteText(){
		PreferenceAdminPage.deleteText("PrefTextModify");
	}
		
	// create option
	@Test
	public void tEAcreateOption(){
		Driver.waitMilli(500);
		PreferenceAdminPage.createOption("TEST_OPTION_NAME_TEST","PrefOption","PrefOption","Pref option spanish",
				"Boolean","true","","valueen","","valuees","");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefOption"));
	}
	
	// modify text
	@Test
	public void tEBmodifyOption(){
		PreferenceAdminPage.modifyOption("PrefOption","PrefOptionModify");
		Assert.assertEquals(true,PreferenceAdminPage.exists("PrefOptionModify"));
	}
	
	// delete text
	@Test
	public void tECdeleteOption(){
		PreferenceAdminPage.deleteOption("PrefOptionModify");
	}
	
	
	/*
	// create a duplicate preference -- negative test
	@Test
	public void createPreferenceTest(){
		PreferenceAdminPage.create();
		
		
	}
	

	*/
	// delete the preference
	@Test
	public void tZAdeletePreferenceTest(){
		Driver.waitMilli(500);
		PreferenceAdminPage.delete("PrefModify");
		Driver.waitMilli(500);
		Assert.assertEquals(false,PreferenceAdminPage.exists("PrefModify"));
		Driver.waitMilli(500);
	}
}
