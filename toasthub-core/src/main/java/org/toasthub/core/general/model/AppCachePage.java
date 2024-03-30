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

package org.toasthub.core.general.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.ConcurrencyManagement;
import javax.ejb.Lock;
import javax.ejb.LockType;
import javax.ejb.Schedule;
import javax.ejb.Singleton;
import javax.inject.Inject;
import javax.inject.Named;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.LanguageSvcIface;
import org.toasthub.core.general.svc.LanguageSvcQual;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.preferences.svc.AppPageSvcIface;
import org.toasthub.core.preferences.svc.AppPageSvcQual;
import org.toasthub.core.preferences.svc.SysPageSvcIface;
import org.toasthub.core.preferences.svc.SysPageSvcQual;
import org.toasthub.core.preferences.sys.model.SysPageFormFieldValue;
import org.toasthub.core.preferences.sys.model.SysPageLabelValue;
import org.toasthub.core.preferences.sys.model.SysPageOptionValue;
import org.toasthub.core.preferences.sys.model.SysPageTextValue;

@Named
@Singleton
@ConcurrencyManagement
public class AppCachePage implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String RESPONSE = "response";
	public static final String REQUEST = "request";
	public static final String APPPAGEPARAMLOC = "appPageParamLoc";
	public static final String APPFORMS = "appForms";
	public static final String APPPAGEFORMNAME = "appPageFormName";
	public static final String APPPAGEFORMFIELDS = "appPageFormFields";
	public static final String APPLABELS = "appLabels";
	public static final String APPPAGELABELNAME = "appPageLabelName";
	public static final String APPPAGELABELS = "appPageLabels";
	public static final String APPTEXTS = "appTexts";
	public static final String APPPAGETEXTNAME = "appPageTextName";
	public static final String APPPAGETEXTS = "appPageTexts";
	public static final String APPOPTIONS = "appOptions";
	public static final String APPPAGEOPTIONNAME = "appPageOptionName";
	public static final String APPPAGEOPTIONS = "appPageOptions";
	
	private Map<String,List<AppPageFormFieldValue>> appPageFormFields = new HashMap<String,List<AppPageFormFieldValue>>();
	private Map<String,List<SysPageFormFieldValue>> sysPageFormFields = new HashMap<String,List<SysPageFormFieldValue>>();
	private Map<String,List<AppPageLabelValue>> appPageLabels = new HashMap<String,List<AppPageLabelValue>>();
	private Map<String,List<SysPageLabelValue>> sysPageLabels = new HashMap<String,List<SysPageLabelValue>>();
	private Map<String,Map<String,AppPageOptionValue>> appPageOptions = new HashMap<String,Map<String,AppPageOptionValue>>();
	private Map<String,Map<String,SysPageOptionValue>> sysPageOptions = new HashMap<String,Map<String,SysPageOptionValue>>();
	private Map<String,Map<String,AppPageTextValue>> appPageTexts = new HashMap<String,Map<String,AppPageTextValue>>();
	private Map<String,Map<String,SysPageTextValue>> sysPageTexts = new HashMap<String,Map<String,SysPageTextValue>>();
	private List<Language> languages = new ArrayList<Language>();
	@Inject	
	@SysPageSvcQual 
	protected SysPageSvcIface sysPageSvc;
	@Inject 
	@AppPageSvcQual 
	protected AppPageSvcIface appPageSvc;
	@Inject 
	@LanguageSvcQual 
	protected LanguageSvcIface languageSvc;
	@Inject	
	protected UtilSvc utilSvc;
	
	// Constructor
	public AppCachePage(){
	}
	
	@Schedule(hour="1")
	public void clearCache(){
		this.setAppPageFormFields(new HashMap<String,List<AppPageFormFieldValue>>());
		this.setSysPageFormFields(new HashMap<String,List<SysPageFormFieldValue>>());
		this.setAppPageLabels(new HashMap<String,List<AppPageLabelValue>>());
		this.setSysPageLabels(new HashMap<String,List<SysPageLabelValue>>());
		this.setAppPageOptions(new HashMap<String,Map<String,AppPageOptionValue>>());
		this.setSysPageOptions(new HashMap<String,Map<String,SysPageOptionValue>>());
		this.setAppPageTexts(new HashMap<String,Map<String,AppPageTextValue>>());
		this.setSysPageTexts(new HashMap<String,Map<String,SysPageTextValue>>());
		this.setLanguages(new ArrayList<Language>());
	}
	
	@Lock(LockType.WRITE)
	public void clearAppCache() {
		this.setAppPageFormFields(new HashMap<String,List<AppPageFormFieldValue>>());
		this.setAppPageLabels(new HashMap<String,List<AppPageLabelValue>>());
		this.setAppPageOptions(new HashMap<String,Map<String,AppPageOptionValue>>());
		this.setAppPageTexts(new HashMap<String,Map<String,AppPageTextValue>>());
		
	}
	
	
	@Lock(LockType.READ)
	public void getPageInfo(RestRequest request, RestResponse response) {
		if (request.containsParam(APPFORMS) && !request.getParam(APPFORMS).equals("") && request.getParam(APPFORMS) instanceof List){
			for (String item : (List<String>) request.getParam(APPFORMS)) {
				request.addParam(APPPAGEFORMNAME, item);
				getAppPageFormFields(request,response);
			}
		}
		if (request.containsParam(APPLABELS) && !request.getParam(APPLABELS).equals("") && request.getParam(APPLABELS) instanceof List){
			for (String item : (List<String>) request.getParam(APPLABELS)) {
				request.addParam(APPPAGELABELNAME, item);
				getAppPageLabels(request,response);
			}
		}
		if (request.containsParam(APPTEXTS) && !request.getParam(APPTEXTS).equals("") && request.getParam(APPTEXTS) instanceof List){
			for (String item : (List<String>) request.getParam(APPTEXTS)) {
				request.addParam(APPPAGETEXTNAME, item);
				getAppPageTexts(request,response);
			}
		}
		if (request.containsParam(APPOPTIONS) && !request.getParam(APPOPTIONS).equals("") && request.getParam(APPOPTIONS) instanceof List){
			for (String item : (List<String>) request.getParam(APPOPTIONS)) {
				request.addParam(APPPAGEOPTIONNAME, item);
				getAppPageOptions(request,response);
			}
		}
		if (request.containsParam("appLanguages") && !request.getParam("appLanguages").equals("") && (Boolean) request.getParam("appLanguages")){
			getLanguages(request,response);
		}
		
		if (request.containsParam("sysPageFormName") && !request.getParam("sysPageFormName").equals("") ){
			getSysPageFormFields(request,response);
		}
		
		if (request.containsParam("sysPageLabelName") && !request.getParam("sysPageLabelName").equals("") ){
			getSysPageLabels(request,response);
		}
		
		if (request.containsParam("sysPageOptionName") && !request.getParam("sysPageOptionName").equals("") ){
			getSysPageOptions(request,response);
		}
		
		if (request.containsParam("sysPageTextName") && !request.getParam("sysPageTextName").equals("") ){
			getSysPageTexts(request,response);
		}
		
	}
	
	@Lock(LockType.READ)
	public void getGlobalInfo(RestRequest request, RestResponse response) {
		if (request.containsParam("sysPageFormName") && !request.getParam("sysPageFormName").equals("") ){
			getSysPageFormFields(request,response);
		}
	}
	// Main Page form fields
	
	@Lock(LockType.READ)
	public void getSysPageFormFields(RestRequest request, RestResponse response) {
		String key = request.getParam("sysPageFormName")+"_"+(String)request.getParam("lang");
		if (this.sysPageFormFields != null && this.sysPageFormFields.containsKey(key)){
			// Pull from memory cache
			Map<String,List<SysPageFormFieldValue>> f = null;
			if (request.containsParam("sysPageParamLoc") && RESPONSE.equals(request.getParam("sysPageParamLoc")) ) {
				if (response.getParams().containsKey("sysPageFormFields")){
					f = (Map<String, List<SysPageFormFieldValue>>) response.getParam("sysPageFormFields");
				} else {
					f = new HashMap<String,List<SysPageFormFieldValue>>();
				}
				f.put((String) request.getParam("sysPageFormName"), this.sysPageFormFields.get(key));
				response.addParam("sysPageFormFields",f);
			} else {
				if (request.getParams().containsKey("sysPageFormFields")){
					f = (Map<String, List<SysPageFormFieldValue>>) request.getParam("sysPageFormFields");
				} else {
					f = new HashMap<String,List<SysPageFormFieldValue>>();
				}
				f.put((String) request.getParam("sysPageFormName"), this.sysPageFormFields.get(key));
				request.addParam("sysPageFormFields",f);
			}
		} else {
			// Get from DB and put in cache
			List<SysPageFormFieldValue> formFields = sysPageSvc.getFormFields((String)request.getParam("sysPageFormName"), (String)request.getParam("lang"));
			if (formFields != null){
				this.addSysPageFormField(key, formFields);
				Map<String,List<SysPageFormFieldValue>> f = null;
				if (request.containsParam("sysPageParamLoc") && RESPONSE.equals(request.getParam("sysPageParamLoc")) ) {
					if (response.getParams().containsKey("sysPageFormFields")){
						f = (Map<String, List<SysPageFormFieldValue>>) response.getParam("sysPageFormFields");
					} else {
						f = new HashMap<String,List<SysPageFormFieldValue>>();
					}
					f.put((String) request.getParam("sysPageFormName"), formFields);
					response.addParam("sysPageFormFields",f);
				} else {
					if (request.getParams().containsKey("sysPageFormFields")){
						f = (Map<String, List<SysPageFormFieldValue>>) request.getParam("sysPageFormFields");
					} else {
						f = new HashMap<String,List<SysPageFormFieldValue>>();
					}
					f.put((String) request.getParam("sysPageFormName"), formFields);
					request.addParam("sysPageFormFields",f);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Sys Page FormField issue", response);
			}
		}
	}
	
	protected void setSysPageFormFields(Map<String,List<SysPageFormFieldValue>> sysPageFormFields) {
		this.sysPageFormFields = sysPageFormFields;
	}
	
	@Lock(LockType.WRITE)
	public void addSysPageFormField(String key,List<SysPageFormFieldValue> sysPageFormFields ){
		if (this.sysPageFormFields != null){
			this.sysPageFormFields.put(key, sysPageFormFields);
		}
	}
	
	@Lock(LockType.WRITE)
	public void clearSysPageFormFieldCache(){
		// Clear cache immediately
		this.setSysPageFormFields(new HashMap<String,List<SysPageFormFieldValue>>());
	}
	
	@Lock(LockType.WRITE)
	public void clearSysPageFormFieldCache(String key){
		// Clear one item in cache immediately
		this.sysPageFormFields.remove(key);
	}
	
	// App Page form fields
	
	@Lock(LockType.READ)
	public void getAppPageFormFields(RestRequest request, RestResponse response) {
		String key = request.getParam(APPPAGEFORMNAME)+"_"+(String)request.getParam(BaseEntity.LANG);
		if (this.appPageFormFields != null && this.appPageFormFields.containsKey(key)){
			// Pull from memory cache
			Map<String,List<AppPageFormFieldValue>> f = null;
			// add to request or response
			if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
				if (response.getParams().containsKey(APPPAGEFORMFIELDS)){
					f = (Map<String, List<AppPageFormFieldValue>>) response.getParam(APPPAGEFORMFIELDS);
				} else {
					f = new HashMap<String,List<AppPageFormFieldValue>>();
				}
				f.put((String) request.getParam(APPPAGEFORMNAME), this.appPageFormFields.get(key));
				response.addParam(APPPAGEFORMFIELDS,f);
			} else {
				if (request.getParams().containsKey(APPPAGEFORMFIELDS)){
					f = (Map<String, List<AppPageFormFieldValue>>) request.getParam(APPPAGEFORMFIELDS);
				} else {
					f = new HashMap<String,List<AppPageFormFieldValue>>();
				}
				f.put((String) request.getParam(APPPAGEFORMNAME), this.appPageFormFields.get(key));
				request.addParam(APPPAGEFORMFIELDS,f);
			}
		} else {
			// Get from DB and put in cache
			List<AppPageFormFieldValue> formFields = appPageSvc.getFormFields((String)request.getParam(APPPAGEFORMNAME), (String)request.getParam(BaseEntity.LANG));
			if (formFields != null){
				// add to cache
				this.addAppPageFormField(key, formFields);
				Map<String,List<AppPageFormFieldValue>> f = null;
				// add to request or response
				if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
					if (response.getParams().containsKey(APPPAGEFORMFIELDS)){
						f = (Map<String, List<AppPageFormFieldValue>>) response.getParam(APPPAGEFORMFIELDS);
					} else {
						f = new HashMap<String,List<AppPageFormFieldValue>>();
					}
					f.put((String) request.getParam(APPPAGEFORMNAME), formFields);
					response.addParam(APPPAGEFORMFIELDS,f);
				} else {
					if (request.getParams().containsKey(APPPAGEFORMFIELDS)){
						f = (Map<String, List<AppPageFormFieldValue>>) request.getParam(APPPAGEFORMFIELDS);
					} else {
						f = new HashMap<String,List<AppPageFormFieldValue>>();
					}
					f.put((String) request.getParam(APPPAGEFORMNAME), formFields);
					request.addParam(APPPAGEFORMFIELDS,f);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "App Page FormField issue", response);
			}
		}
	}
	
	
	protected void setAppPageFormFields(Map<String,List<AppPageFormFieldValue>> appPageFormFields) {
		this.appPageFormFields = appPageFormFields;
	}
	
	@Lock(LockType.WRITE)
	public void addAppPageFormField(String key,List<AppPageFormFieldValue> appPageFormFields ){
		if (this.appPageFormFields != null){
			this.appPageFormFields.put(key, appPageFormFields);
		}
	}
	
	@Lock(LockType.WRITE)
	public void clearAppPageFormFieldCache(){
		// Clear cache immediately
		this.setAppPageFormFields(new HashMap<String,List<AppPageFormFieldValue>>());
	}
	
	@Lock(LockType.WRITE)
	public void clearAppPageFormFieldCache(String key){
		// Clear one item in cache immediately
		this.appPageFormFields.remove(key);
	}
	
	
	// Main Page Labels
	
	@Lock(LockType.READ)
	public void getSysPageLabels(RestRequest request, RestResponse response) {
		String key = request.getParam("sysPageLabelName")+"_"+(String)request.getParam(BaseEntity.LANG);
		if (this.sysPageLabels != null && this.sysPageLabels.containsKey(key)){
			// Pull from memory cache
			Map<String,List<SysPageLabelValue>> f = null;
			if (request.containsParam("sysPageParamLoc") && RESPONSE.equals(request.getParam("sysPageParamLoc")) ) {
				if (response.getParams().containsKey("sysPageLabels")){
					f = (Map<String, List<SysPageLabelValue>>) response.getParam("sysPageLabels");
				} else {
					f = new HashMap<String,List<SysPageLabelValue>>();
				}
				f.put((String) request.getParam("sysPageLabelName"), this.sysPageLabels.get(key));
				response.addParam("sysPageLabels",f);
			} else {
				if (request.getParams().containsKey("sysPageLabels")){
					f = (Map<String, List<SysPageLabelValue>>) request.getParam("sysPageLabels");
				} else {
					f = new HashMap<String,List<SysPageLabelValue>>();
				}
				f.put((String) request.getParam("sysPageLabelName"), this.sysPageLabels.get(key));
				request.addParam("sysPageLabels",f);
			}
		} else {
			// Get from DB and put in cache
			List<SysPageLabelValue> labels = sysPageSvc.getLabels((String)request.getParam("sysPageLabelName"), (String)request.getParam("lang"));
			if (labels != null){
				this.addSysPageLabel(key, labels);
				Map<String,List<SysPageLabelValue>> f = null;
				if (request.containsParam("sysPageParamLoc") && "response".equals(request.getParam("sysPageParamLoc")) ) {
					if (response.getParams().containsKey("sysPageLabels")){
						f = (Map<String, List<SysPageLabelValue>>) response.getParam("sysPageLabels");
					} else {
						f = new HashMap<String,List<SysPageLabelValue>>();
					}
					f.put((String) request.getParam("sysPageLabelName"), labels);
					response.addParam("sysPageLabels", f);
				} else {
					if (request.getParams().containsKey("sysPageLabels")){
						f = (Map<String, List<SysPageLabelValue>>) request.getParam("sysPageLabels");
					} else {
						f = new HashMap<String,List<SysPageLabelValue>>();
					}
					f.put((String) request.getParam("sysPageLabelName"), labels);
					request.addParam("sysPageLabels", f);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Sys Page Label issue", response);
			}
		}
	}
	
	protected void setSysPageLabels(Map<String,List<SysPageLabelValue>> sysPageLabels) {
		this.sysPageLabels = sysPageLabels;
	}
	
	@Lock(LockType.WRITE)
	public void addSysPageLabel(String key, List<SysPageLabelValue> sysPageLabels){
		if (this.sysPageLabels != null){
			this.sysPageLabels.put(key, sysPageLabels);
		}
	}
	
	@Lock(LockType.WRITE)
	public void clearSysPageLabelCache(){
		// Clear cache immediately
		this.setSysPageLabels(new HashMap<String,List<SysPageLabelValue>>());
	}
	
	@Lock(LockType.WRITE)
	public void clearSysPageLabelCache(String key){
		// Clear one item in cache immediately
		this.sysPageLabels.remove(key);
	}
		
	// App Page Labels
	@Lock(LockType.READ)
	public void getAppPageLabels(RestRequest request, RestResponse response) {
		String key = request.getParam(APPPAGELABELNAME)+"_"+(String)request.getParam(BaseEntity.LANG);
		if (this.appPageLabels != null && this.appPageLabels.containsKey(key)){
			// Pull from memory cache
			Map<String,List<AppPageLabelValue>> l = null;
			// add to request or response
			if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
				if (response.getParams().containsKey(APPPAGELABELS)){
					l = (Map<String, List<AppPageLabelValue>>) response.getParam(APPPAGELABELS);
				} else {
					l = new HashMap<String,List<AppPageLabelValue>>();
				}
				l.put((String) request.getParam(APPPAGELABELNAME), this.appPageLabels.get(key));
				response.addParam(APPPAGELABELS,l);
			} else {
				if (request.getParams().containsKey(APPPAGELABELS)){
					l = (Map<String, List<AppPageLabelValue>>) request.getParam(APPPAGELABELS);
				} else {
					l = new HashMap<String,List<AppPageLabelValue>>();
				}
				l.put((String) request.getParam(APPPAGELABELNAME), this.appPageLabels.get(key));
				request.addParam(APPPAGELABELS,l);
			}
		} else {
			// Get from DB and put in cache
			List<AppPageLabelValue> labels = appPageSvc.getLabels((String)request.getParam(APPPAGELABELNAME), (String)request.getParam(BaseEntity.LANG));
			if (labels != null){
				// add to cache
				this.addAppPageLabel(key, labels);
				Map<String,List<AppPageLabelValue>> l = null;
				// add to request or response
				if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
					if (response.getParams().containsKey(APPPAGELABELS)){
						l = (Map<String, List<AppPageLabelValue>>) response.getParam(APPPAGELABELS);
					} else {
						l = new HashMap<String,List<AppPageLabelValue>>();
					}
					l.put((String) request.getParam(APPPAGELABELNAME), labels);
					response.addParam(APPPAGELABELS, l);
				} else {
					if (request.getParams().containsKey(APPPAGELABELS)){
						l = (Map<String, List<AppPageLabelValue>>) request.getParam(APPPAGELABELS);
					} else {
						l = new HashMap<String,List<AppPageLabelValue>>();
					}
					l.put((String) request.getParam(APPPAGELABELNAME), labels);
					request.addParam(APPPAGELABELS, l);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "App Page Label issue", response);
			}
		}
	}
	
	protected void setAppPageLabels(Map<String,List<AppPageLabelValue>> appPageLabels) {
		this.appPageLabels = appPageLabels;
	}
	
	@Lock(LockType.WRITE)
	public void addAppPageLabel(String key, List<AppPageLabelValue> appPageLabels){
		if (this.appPageLabels != null){
			this.appPageLabels.put(key, appPageLabels);
		}
	}
	
	@Lock(LockType.WRITE)
	public void clearAppPageLabelCache(){
		// Clear cache immediately
		this.setAppPageLabels(new HashMap<String,List<AppPageLabelValue>>());
	}
	@Lock(LockType.WRITE)
	public void clearAppPageLabelCache(String key){
		// Clear one item in cache immediately
		this.appPageLabels.remove(key);
	}
	
	// Main Page Options
	
	@Lock(LockType.READ)
	public void getSysPageOptions(RestRequest request, RestResponse response) {
		String key = request.getParam("sysPageOptionName")+"_"+(String)request.getParam("lang");
		if (this.sysPageOptions != null && this.sysPageOptions.containsKey(key)){
			if (request.containsParam("sysPageParamLoc") && "response".equals(request.getParam("sysPageParamLoc")) ) {
				response.addParam("sysPageOptions", this.sysPageOptions.get(key));
			} else {
				request.addParam("sysPageOptions", this.sysPageOptions.get(key));
			}
		} else {
			Map<String,SysPageOptionValue> options = sysPageSvc.getOptionsMap((String)request.getParam("sysPageOptionName"), (String)request.getParam("lang"));
			if (options != null){
				this.addSysPageOption(key, options);
				if (request.containsParam("sysPageParamLoc") && "response".equals(request.getParam("sysPageParamLoc")) ) {
					response.addParam("sysPageOptions", options);
				} else {
					request.addParam("sysPageOptions", options);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Sys Page Option issue", response);
			}
		}
	}
	
	protected void setSysPageOptions(Map<String,Map<String,SysPageOptionValue>> sysPageOptions) {
		this.sysPageOptions = sysPageOptions;
	}
	@Lock(LockType.WRITE)
	public void addSysPageOption(String key, Map<String,SysPageOptionValue> sysPageOptions){
		if (this.sysPageOptions != null){
			this.sysPageOptions.put(key, sysPageOptions);
		}
	}
	@Lock(LockType.WRITE)
	public void clearSysPageOptionCache(){
		this.setSysPageOptions(new HashMap<String,Map<String,SysPageOptionValue>>());
	}
	@Lock(LockType.WRITE)
	public void clearSysPageOptionCache(String key){
		this.sysPageOptions.remove(key);
	}
		
	// App Page Options
	
	@Lock(LockType.READ)
	public void getAppPageOptions(RestRequest request, RestResponse response) {
		String key = request.getParam(APPPAGEOPTIONNAME)+"_"+(String)request.getParam(BaseEntity.LANG);
		if (this.appPageOptions != null && this.appPageOptions.containsKey(key)){
			// Pull from Memory
			Map<String,Map<String,AppPageOptionValue>> o = null;
			// add to request or response
			if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
				if (response.getParams().containsKey(APPPAGEOPTIONS)){
					o = (Map<String, Map<String,AppPageOptionValue>>) response.getParam(APPPAGEOPTIONS);
				} else {
					o = new HashMap<String,Map<String,AppPageOptionValue>>();
				}
				o.put((String) request.getParam(APPPAGEOPTIONNAME), this.appPageOptions.get(key));
				response.addParam(APPPAGEOPTIONS, o);
			} else {
				if (request.getParams().containsKey(APPPAGEOPTIONS)){
					o = (Map<String, Map<String,AppPageOptionValue>>) request.getParam(APPPAGEOPTIONS);
				} else {
					o = new HashMap<String,Map<String,AppPageOptionValue>>();
				}
				o.put((String) request.getParam(APPPAGEOPTIONNAME), this.appPageOptions.get(key));
				request.addParam(APPPAGEOPTIONS,o);
			}
		} else {
			// Pull from DB
			Map<String,AppPageOptionValue> appOptions = appPageSvc.getOptionsMap((String)request.getParam(APPPAGEOPTIONNAME), (String)request.getParam(BaseEntity.LANG));
			if (appOptions != null){
				// add to cache
				this.addAppPageOption(key, appOptions);
				Map<String,Map<String,AppPageOptionValue>> o = null;
				// add to request or response
				if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
					if (response.getParams().containsKey(APPPAGEOPTIONS)){
						o = (Map<String, Map<String,AppPageOptionValue>>) response.getParam(APPPAGEOPTIONS);
					} else {
						o = new HashMap<String,Map<String,AppPageOptionValue>>();
					}
					o.put((String) request.getParam(APPPAGEOPTIONNAME), appOptions);
					response.addParam(APPPAGEOPTIONS, o);
				} else {	
					if (request.getParams().containsKey(APPPAGEOPTIONS)){
						o = (Map<String, Map<String,AppPageOptionValue>>) request.getParam(APPPAGEOPTIONS);
					} else {
						o = new HashMap<String,Map<String,AppPageOptionValue>>();
					}
					o.put((String) request.getParam(APPPAGEOPTIONNAME), appOptions);
					request.addParam(APPPAGEOPTIONS, o);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Page Option issue", response);
			}
		}
	}
	
	protected void setAppPageOptions(Map<String,Map<String,AppPageOptionValue>> appPageOptions) {
		this.appPageOptions = appPageOptions;
	}
	
	@Lock(LockType.WRITE)
	public void addAppPageOption(String key, Map<String,AppPageOptionValue> appPageOptions){
		if (this.appPageOptions != null){
			this.appPageOptions.put(key, appPageOptions);
		}
	}
	@Lock(LockType.WRITE)
	public void clearAppPageOptionCache(){
		this.setAppPageOptions(new HashMap<String,Map<String,AppPageOptionValue>>());
	}
	@Lock(LockType.WRITE)
	public void clearAppPageOptionCache(String key){
		this.appPageOptions.remove(key);
	}
	
	// Main Page Texts
	@Lock(LockType.READ)
	public void getSysPageTexts(RestRequest request, RestResponse response) {
		String key = request.getParam("sysPageTextName")+"_"+(String)request.getParam("lang");
		if (this.sysPageTexts != null && this.sysPageTexts.containsKey(key)){
			// Pull from memory cache
			if (request.containsParam("sysPageParamLoc") && "response".equals(request.getParam("sysPageParamLoc")) ) {
				response.addParam("sysPageTexts", this.sysPageTexts.get(key));
			} else {
				request.addParam("sysPageTexts", this.sysPageTexts.get(key));
			}
		} else {
			// Get from DB and put in cache
			Map<String,SysPageTextValue> texts = sysPageSvc.getTextsMap((String)request.getParam("sysPageTextName"), (String)request.getParam("lang"));
			if (texts != null){
				this.addSysPageText(key, texts);
				if (request.containsParam("sysPageParamLoc") && "response".equals(request.getParam("sysPageParamLoc")) ) {
					response.addParam("sysPageTexts", texts);
				} else {
					request.addParam("sysPageTexts", texts);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Sys Page Text issue", response);
			}
		}
	}
	
	protected void setSysPageTexts(Map<String,Map<String,SysPageTextValue>> sysPageTexts) {
		this.sysPageTexts = sysPageTexts;
	}
	@Lock(LockType.WRITE)
	protected void addSysPageText(String key, Map<String,SysPageTextValue> sysPageTexts){
		if (this.sysPageTexts != null){
			this.sysPageTexts.put(key, sysPageTexts);
		}
	}
	@Lock(LockType.WRITE)
	public void clearSysPageTextCache(){
		// Clear cache immediately
		this.setSysPageTexts(new HashMap<String,Map<String,SysPageTextValue>>());
	}
	@Lock(LockType.WRITE)
	public void clearSysPageTextCache(String key){
		// Clear one item in cache immediately
		this.sysPageTexts.remove(key);
	}
		
	// App Page Texts
	
	@Lock(LockType.READ)
	public void getAppPageTexts(RestRequest request, RestResponse response) {
		String key = request.getParam(APPPAGETEXTNAME)+"_"+(String)request.getParam(BaseEntity.LANG);
		if (this.appPageTexts != null && this.appPageTexts.containsKey(key)){
			// Pull from memory cache
			Map<String,Map<String,AppPageTextValue>> t = null;
			if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
				if (response.getParams().containsKey(APPPAGETEXTS)){
					t = (Map<String, Map<String,AppPageTextValue>>) response.getParam(APPPAGETEXTS);
				} else {
					t = new HashMap<String,Map<String,AppPageTextValue>>();
				}
				t.put((String) request.getParam(APPPAGETEXTNAME), this.appPageTexts.get(key));
				response.addParam(APPPAGETEXTS, t);
			} else {
				if (request.getParams().containsKey(APPPAGETEXTS)){
					t = (Map<String, Map<String,AppPageTextValue>>) request.getParam(APPPAGETEXTS);
				} else {
					t = new HashMap<String,Map<String,AppPageTextValue>>();
				}
				t.put((String) request.getParam(APPPAGETEXTNAME), this.appPageTexts.get(key));
				request.addParam(APPPAGETEXTS,t);
			}
		} else {
			// Get from DB and put in cache
			Map<String,AppPageTextValue> appTexts = appPageSvc.getTextsMap((String)request.getParam(APPPAGETEXTNAME), (String)request.getParam(BaseEntity.LANG));
			if (appTexts != null){
				// add to cache
				this.addAppPageText(key, appTexts);
				// add to request or response
				Map<String,Map<String,AppPageTextValue>> t = null;
				if (request.containsParam(APPPAGEPARAMLOC) && RESPONSE.equals(request.getParam(APPPAGEPARAMLOC)) ) {
					if (response.getParams().containsKey(APPPAGETEXTS)){
						t = (Map<String, Map<String,AppPageTextValue>>) response.getParam(APPPAGETEXTS);
					} else {
						t = new HashMap<String,Map<String,AppPageTextValue>>();
					}
					t.put((String) request.getParam(APPPAGETEXTNAME), appTexts);
					response.addParam(APPPAGETEXTS, t);
				} else {
					if (request.getParams().containsKey(APPPAGETEXTS)){
						t = (Map<String, Map<String,AppPageTextValue>>) request.getParam(APPPAGETEXTS);
					} else {
						t = new HashMap<String,Map<String,AppPageTextValue>>();
					}
					t.put((String) request.getParam(APPPAGETEXTNAME), appTexts);
					request.addParam(APPPAGETEXTS, t);
				}
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Page Text issue", response);
			}
		}
	}
	
	protected void setAppPageTexts(Map<String,Map<String,AppPageTextValue>> appPageTexts) {
		this.appPageTexts = appPageTexts;
	}
	
	@Lock(LockType.WRITE)
	protected void addAppPageText(String key, Map<String,AppPageTextValue> appPageTexts){
		if (this.appPageTexts != null){
			this.appPageTexts.put(key, appPageTexts);
		}
	}
	@Lock(LockType.WRITE)
	public void clearAppPageTextCache(){
		// Clear cache immediately
		this.setAppPageTexts(new HashMap<String,Map<String,AppPageTextValue>>());
	}
	@Lock(LockType.WRITE)
	public void clearAppPageTextCache(String key){
		// Clear one item in cache immediately
		this.appPageTexts.remove(key);
	}

	@Lock(LockType.READ)
	public void getLanguages(RestRequest request, RestResponse response) {
		if (this.languages != null && !this.languages.isEmpty()) {
			// Pull from memory cache
			response.addParam("languages", this.languages);
		} else {
			// Get from DB and put in cache
			RestRequest LangRequest = new RestRequest();
			LangRequest.addParam(BaseEntity.ACTIVE, true);
			RestResponse LangResponse = new RestResponse();
			languageSvc.getAllLanguages(LangRequest,LangResponse);
			if (LangResponse.containsParam(BaseEntity.ITEMS)){
				this.setLanguages((List<Language>) LangResponse.getParam(BaseEntity.ITEMS));
				response.addParam("languages", this.languages);
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.PAGEOPTIONS, "Languages issue", response);
			}
		}
	}
	
	@Lock(LockType.WRITE)
	public void setLanguages(List<Language> languages) {
		this.languages = languages;
	}
	
	@Lock(LockType.WRITE)
	public void clearLanguageCache(){
		// Clear cache immediately
		this.setLanguages(new ArrayList<Language>());
	}
	
	@Lock(LockType.READ)
	public String getDefaultLang(){
		String lang = "en";
		if (this.languages != null && !this.languages.isEmpty()) {
			for (Language language : languages) {
				if (language.isDefaultLang()){
					lang = language.getCode();
				}
			}

		}
		return lang;
	}
}
