package org.toasthub.test.admin.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.toasthub.test.admin.tests.ApplicationTests;
import org.toasthub.test.admin.tests.ClientDomainTests;
import org.toasthub.test.admin.tests.LanguageTests;
import org.toasthub.test.admin.tests.MenuTests;
import org.toasthub.test.admin.tests.PermissionTests;
import org.toasthub.test.admin.tests.PreferenceTests;
import org.toasthub.test.admin.tests.RoleTests;
import org.toasthub.test.admin.tests.ServiceCrawlerTests;
import org.toasthub.test.admin.tests.UserTests;

@RunWith(Suite.class)

@Suite.SuiteClasses({
	ApplicationTests.class,
	ClientDomainTests.class,
	   LanguageTests.class,
	   ServiceCrawlerTests.class,
	   PreferenceTests.class,
	   MenuTests.class,
	   PermissionTests.class,
	   RoleTests.class,
	   UserTests.class,
	})


public class AdminSuite {

}
