package org.toasthub.test.core.general;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.toasthub.test.core.selenium.Driver;

public class BaseTests {

	@BeforeClass
    public static void init(){
       Driver.Initialize();
	} 
	
	@AfterClass
	 public static void close(){
		 Driver.getInstance().quit();
	 }
}
