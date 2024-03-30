package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.ConcurrencyManagement;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.inject.Named;

@Named
@Singleton
@ConcurrencyManagement
public class AppCacheMenu implements Serializable {

	private static final long serialVersionUID = 1L;
	private Map<String,Map<Integer,MenuItem>> menu = new HashMap<String,Map<Integer,MenuItem>>();

	
	// Constructor
	public AppCacheMenu(){
	}
	
	@Schedule(hour="1")
	public void clearCache(){
		this.menu = new HashMap<String,Map<Integer,MenuItem>>();
	}

	// Menus
	@Lock(LockType.READ)
	public Map<Integer,MenuItem> getMenu(String key) {
		if (this.menu != null && this.menu.containsKey(key)){
			return this.menu.get(key);
		}
		return null;
	}
	@Lock(LockType.WRITE)
	public void addMenu(String key, Map<Integer,MenuItem> menu) {
		if (this.menu != null){
			this.menu.put(key, menu);
		}
	}
	@Lock(LockType.WRITE)
	public void clearMenuCache(){
		this.menu = null;
		this.menu = new HashMap<String,Map<Integer,MenuItem>>();
	}
}
