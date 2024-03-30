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

package org.toasthub.core.preferences.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.model.AppPageFormFieldValue;
import org.toasthub.core.general.model.AppPageLabelValue;
import org.toasthub.core.general.model.AppPageName;
import org.toasthub.core.general.model.AppPageOptionValue;
import org.toasthub.core.general.model.AppPageTextValue;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.core.preferences.dao.AppFormFieldDaoIface;
import org.toasthub.core.preferences.dao.AppFormFieldDaoQual;
import org.toasthub.core.preferences.dao.AppLabelDaoIface;
import org.toasthub.core.preferences.dao.AppLabelDaoQual;
import org.toasthub.core.preferences.dao.AppOptionDaoIface;
import org.toasthub.core.preferences.dao.AppOptionDaoQual;
import org.toasthub.core.preferences.dao.AppPageDaoIface;
import org.toasthub.core.preferences.dao.AppPageDaoQual;
import org.toasthub.core.preferences.dao.AppTextDaoIface;
import org.toasthub.core.preferences.dao.AppTextDaoQual;

@AppPageSvcQual
@RequestScoped
public class AppPageSvc implements AppPageSvcIface {

	@Inject @AppPageDaoQual AppPageDaoIface pageDao;	
	@Inject @AppFormFieldDaoQual AppFormFieldDaoIface formFieldDao;
	@Inject @AppLabelDaoQual AppLabelDaoIface labelDao;
	@Inject @AppTextDaoQual AppTextDaoIface textDao;
	@Inject @AppOptionDaoQual AppOptionDaoIface optionDao;
	@Inject UtilSvc utilSvc;
	
	// Page name
	public AppPageName getPageName(Long id) {
		return pageDao.getPageName(id);
	}

	public AppPageName getPageName(String name) {
		return pageDao.getPageName(name);
	}

	// Form Fields
	public List<AppPageFormFieldValue> getFormFields(String pageName, String lang) {
		return formFieldDao.getFormFields(pageName, lang);
	}

	public Map<String, AppPageFormFieldValue> getFormFieldsMap(String pageName,String lang) {
		List<AppPageFormFieldValue> pageFormFields = formFieldDao.getFormFields(pageName, lang);
		Map<String, AppPageFormFieldValue> formFieldsMap = new HashMap<String,AppPageFormFieldValue>();
		for (AppPageFormFieldValue field : pageFormFields){
			formFieldsMap.put(field.getPageFormFieldName().getName(), field);
		}
		return formFieldsMap;
	}
	
	// Labels
	public List<AppPageLabelValue> getLabels(String pageName, String lang) {
		return labelDao.getLabels(pageName, lang);
	}

	// Options
	public List<AppPageOptionValue> getOptions(String pageName, String lang) {
		return optionDao.getOptions(pageName, lang);
	}

	public Map<String, AppPageOptionValue> getOptionsMap(String pageName, String lang) {
		List<AppPageOptionValue> pageOptions = optionDao.getOptions(pageName, lang);
		Map<String, AppPageOptionValue> optionsMap = new HashMap<String, AppPageOptionValue>();
		for (AppPageOptionValue option : pageOptions){
			optionsMap.put(option.getName(), option);
		}
		return optionsMap;
	}

	// Texts
	public List<AppPageTextValue> getTexts(String pageName, String lang) {
		return textDao.getTexts(pageName, lang);
	}

	public Map<String, AppPageTextValue> getTextsMap(String pageName, String lang) {
		List<AppPageTextValue> pageTexts = textDao.getTexts(pageName, lang);
		Map<String, AppPageTextValue> textsMap = new HashMap<String,AppPageTextValue>();
		for (AppPageTextValue text : pageTexts){
			textsMap.put(text.getName(), text);
		}
		return textsMap;
	}

	@Override
	public void itemCount(RestRequest request, RestResponse response) {
		try {
			if (request.containsParam("category")) {
				pageDao.itemCount(request, response);
			} else {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing category param", response);
			}
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Count failed", response);
			e.printStackTrace();
		}
		
	}

	@Override
	public void items(RestRequest request, RestResponse response) {
		try {
			if (request.containsParam("category")) {
				pageDao.items(request, response);
			} else {
				utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Missing category param", response);
			}
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "List failed", response);
			e.printStackTrace();
		}
		
	}

	@Override
	public void item(RestRequest request, RestResponse response) {
		try {
			pageDao.item(request, response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Item Failed", response);
			e.printStackTrace();
		}
		
	}

}
