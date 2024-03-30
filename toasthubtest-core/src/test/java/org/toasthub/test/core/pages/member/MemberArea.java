package org.toasthub.test.core.pages.member;

import org.openqa.selenium.NoSuchElementException;
import org.toasthub.test.core.selenium.Driver;

public class MemberArea {

	public static Boolean IsAt() {
		try {
			Driver.findOrWaitById("MemberArea");
			return true;
		} catch (NoSuchElementException e) {
			return false;
		}
	}
}
