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

import org.toasthub.core.preferences.dao.SysFormFieldDaoIface;
import org.toasthub.core.preferences.dao.SysFormFieldDaoQual;
import org.toasthub.core.preferences.dao.SysLabelDaoIface;
import org.toasthub.core.preferences.dao.SysLabelDaoQual;
import org.toasthub.core.preferences.dao.SysOptionDaoIface;
import org.toasthub.core.preferences.dao.SysOptionDaoQual;
import org.toasthub.core.preferences.dao.SysPageDaoIface;
import org.toasthub.core.preferences.dao.SysPageDaoQual;
import org.toasthub.core.preferences.dao.SysTextDaoIface;
import org.toasthub.core.preferences.dao.SysTextDaoQual;
import org.toasthub.core.preferences.sys.model.SysPageFormFieldValue;
import org.toasthub.core.preferences.sys.model.SysPageLabelValue;
import org.toasthub.core.preferences.sys.model.SysPageName;
import org.toasthub.core.preferences.sys.model.SysPageOptionValue;
import org.toasthub.core.preferences.sys.model.SysPageTextValue;

@SysPageSvcQual
@RequestScoped
public class SysPageSvc implements SysPageSvcIface {

	@Inject @SysPageDaoQual SysPageDaoIface pageDao;
	@Inject @SysFormFieldDaoQual SysFormFieldDaoIface formFieldDao;
	@Inject @SysLabelDaoQual SysLabelDaoIface labelDao;
	@Inject @SysTextDaoQual SysTextDaoIface textDao;
	@Inject @SysOptionDaoQual SysOptionDaoIface optionDao;
	
	// Page name
	public SysPageName getPageName(Long id) {
		return pageDao.getPageName(id);
	}

	public SysPageName getPageName(String name) {
		return pageDao.getPageName(name);
	}

	// Form Fields
	public List<SysPageFormFieldValue> getFormFields(String pageName, String lang) {
		return formFieldDao.getFormFields(pageName, lang);
	}

	public Map<String, SysPageFormFieldValue> getFormFieldsMap(String pageName,String lang) {
		List<SysPageFormFieldValue> pageFormFields = formFieldDao.getFormFields(pageName, lang);
		Map<String, SysPageFormFieldValue> formFieldsMap = new HashMap<String,SysPageFormFieldValue>();
		for (SysPageFormFieldValue field : pageFormFields){
			formFieldsMap.put(field.getPageFormFieldName().getName(), field);
		}
		return formFieldsMap;
	}
	
	// Labels
	public List<SysPageLabelValue> getLabels(String pageName, String lang) {
		return labelDao.getLabels(pageName, lang);
	}

	// Options
	public List<SysPageOptionValue> getOptions(String pageName, String lang) {
		return optionDao.getOptions(pageName, lang);
	}

	public Map<String, SysPageOptionValue> getOptionsMap(String pageName, String lang) {
		List<SysPageOptionValue> pageOptions = optionDao.getOptions(pageName, lang);
		Map<String, SysPageOptionValue> optionsMap = new HashMap<String, SysPageOptionValue>();
		for (SysPageOptionValue option : pageOptions){
			optionsMap.put(option.getPageOptionName().getName(), option);
		}
		return optionsMap;
	}

	// Texts
	public List<SysPageTextValue> getTexts(String pageName, String lang) {
		return textDao.getTexts(pageName, lang);
	}

	public Map<String, SysPageTextValue> getTextsMap(String pageName, String lang) {
		List<SysPageTextValue> pageTexts = textDao.getTexts(pageName, lang);
		Map<String, SysPageTextValue> textsMap = new HashMap<String,SysPageTextValue>();
		for (SysPageTextValue text : pageTexts){
			textsMap.put(text.getPageTextName().getName(), text);
		}
		return textsMap;
	}

}
