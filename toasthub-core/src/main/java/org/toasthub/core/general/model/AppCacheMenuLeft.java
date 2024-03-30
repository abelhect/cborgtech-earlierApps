package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

//import javax.annotation.Resource;
import javax.ejb.ConcurrencyManagement;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.inject.Named;
//import javax.naming.InitialContext;
//import javax.naming.NamingException;

//import org.infinispan.Cache;
//import org.infinispan.manager.CacheContainer;
//import org.infinispan.manager.DefaultCacheManager;
//import org.infinispan.manager.EmbeddedCacheManager;

@Named
@Singleton
@ConcurrencyManagement
public class AppCacheMenuLeft implements Serializable {

	private static final long serialVersionUID = 1L;
	private Map<String,Map<Integer,MenuItem>> menuCache = new HashMap<String,Map<Integer,MenuItem>>();
	//private CacheContainer container;  
	//private Cache<String,Map<Integer,MenuItem>> menuCache;

	//private EmbeddedCacheManager cManager = new DefaultCacheManager();
	//private Cache<String,Map<Integer,MenuItem>> menuCache = cManager.getCache("generalApp");
	
	// Constructor
	public AppCacheMenuLeft(){
		/*try {
		    InitialContext jndiContext = new InitialContext();
			container = (CacheContainer) jndiContext.lookup("java:jboss/infinispan/container/eternalApp");
			menuCache = container.getCache("generalApp");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
	@Schedule(hour="1")
	public void clearCache(){
		this.menuCache = new HashMap<String,Map<Integer,MenuItem>>();
	}

	// Menus
	@Lock(LockType.READ)
	public Map<Integer,MenuItem> getMenuLeft(String key) {
		if (this.menuCache != null && this.menuCache.containsKey(key)){
			return this.menuCache.get(key);
		}
		return null;
	}
	@Lock(LockType.WRITE)
	public void addMenuLeft(String key, Map<Integer,MenuItem> menuLeft) {
		if (this.menuCache != null){
			this.menuCache.put(key, menuLeft);
		}
	}
	@Lock(LockType.WRITE)
	public void clearMenuCache(){
		this.menuCache = null;
		this.menuCache = new HashMap<String,Map<Integer,MenuItem>>();
	}
}
