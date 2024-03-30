package org.toasthub.core.general.svc;

import javax.persistence.EntityManager;

public interface EntityManagerSvc {

	public EntityManager getEntityMgr(String type);
	public EntityManager getInstance();
	public EntityManager getEntityMgrMain();
	public String getAppName();
	public String getAppDomain();
	public String getHTMLPrefix();
	public String getPublicLayout();
	public String getAdminLayout();
	public String getMemberLayout();
	public String getSysAdminLayout();
}
