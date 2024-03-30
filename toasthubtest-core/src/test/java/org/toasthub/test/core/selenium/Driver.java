package org.toasthub.test.core.selenium;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.toasthub.test.core.general.GeneralSettings;

public class Driver {

	private static WebDriver Instance;
	
	public static void Initialize() {
		System.setProperty("webdriver.chrome.driver", GeneralSettings.exePath);
		Instance = new ChromeDriver();
		// DO NOT CHANGE THIS we are using Explicit wait  use the getAndWait instead of findElement
		Instance.manage().timeouts().implicitlyWait(0, TimeUnit.SECONDS);
	}

	public static WebDriver getInstance() {
		return Instance;
	}

	//public static void setInstance(WebDriver instance) {
	//	Instance = instance;
	//}
	
	public static void waitSeconds(Integer seconds){
		try {
			Thread.sleep(seconds * 1000);
		} catch (InterruptedException e) {
		}
	}
	
	public static void waitMilli(Integer msec){
		try {
			Thread.sleep(msec);
		} catch (InterruptedException e) {
		}
	}
	
	public static WebElement findOrWaitById(String id){
		WebDriverWait wait = new WebDriverWait(Instance, 10);
		return wait.until(ExpectedConditions.elementToBeClickable(By.id(id)));
	}
	
	public static WebElement findOrWaitByXPath(String xpath){
		WebDriverWait wait = new WebDriverWait(Instance, 10);
		return wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
	}
	
	public static Boolean exists(String xpath){
		WebDriverWait wait = new WebDriverWait(Driver.getInstance(), 2);
		try {
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath)));
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
