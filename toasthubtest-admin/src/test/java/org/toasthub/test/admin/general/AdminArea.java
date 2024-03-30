package org.toasthub.test.admin.general;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.toasthub.test.core.selenium.Driver;

public class AdminArea {

	public static Boolean IsAt() {
		try {
			Driver.getInstance().findElement(By.id("AdminArea"));
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}
}
