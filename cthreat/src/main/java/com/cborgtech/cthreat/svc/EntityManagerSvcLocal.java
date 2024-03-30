/*
 * Copyright (C) 2016 The ToastHub Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cborgtech.cthreat.svc;

import javax.annotation.Priority;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.enterprise.inject.Alternative;
import javax.inject.Inject;
import javax.interceptor.Interceptor;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.toasthub.core.general.model.AppCacheClientDomains;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.utils.SessionHolder;
import org.toasthub.core.system.model.ClientDomain;

@Alternative
@Priority(Interceptor.Priority.APPLICATION+10)
public class EntityManagerSvcLocal implements EntityManagerSvc {
	
	@PersistenceContext(unitName = "cthreatmain")  
    protected EntityManager main;
	
	@PersistenceContext(unitName = "cthreat1")
	protected EntityManager client1;
	
	@Inject AppCacheClientDomains appCacheClientDomains;
	
	public EntityManager getEntityMgr(String type) {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
		
		if (type.equals("cthreat1")){
			return client1;
		} else {
			return client1;
		}
		
	}
	
	@TransactionAttribute(TransactionAttributeType.REQUIRES_NEW)
	public EntityManager getInstance(){
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		if (cdomain.getAPPDomain().equals("cthreat1")){
			return client1;
		} else {
			return client1;
		}
	}

	public EntityManager getEntityMgrMain(){
		return main;
	}
	
	public String getAppName() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getAPPName();
	}
	
	public String getAppDomain() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getAPPDomain();
	}
	
	public String getHTMLPrefix() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getHTMLPrefix();
	}
	
	public String getPublicLayout() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getPublicLayout();
	}
	
	public String getAdminLayout() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getAdminLayout();
	}
	public String getMemberLayout() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getMemberLayout();
	}
	public String getSysAdminLayout() {
		String url = SessionHolder.getURLDomain();
		ClientDomain cdomain = null;
		if (appCacheClientDomains.getClientDomains().containsKey(url)){
			cdomain = appCacheClientDomains.getClientDomains().get(url);
		} else {
			cdomain = (ClientDomain) main.createQuery("FROM ClientDomain WHERE URLDomain = :url").setParameter("url",url).getSingleResult();
			if (cdomain != null){
				appCacheClientDomains.getClientDomains().put(url, cdomain);
			}
		}
		return cdomain.getSysAdminLayout();
	}
}
