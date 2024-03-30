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

import java.util.List;
import java.util.Map;

import org.toasthub.core.preferences.sys.model.SysPageFormFieldValue;
import org.toasthub.core.preferences.sys.model.SysPageLabelValue;
import org.toasthub.core.preferences.sys.model.SysPageName;
import org.toasthub.core.preferences.sys.model.SysPageOptionValue;
import org.toasthub.core.preferences.sys.model.SysPageTextValue;

public interface SysPageSvcIface {

	public SysPageName getPageName(Long id);
	public SysPageName getPageName(String name);
	public List<SysPageFormFieldValue> getFormFields(String pageName, String lang);
	public Map<String, SysPageFormFieldValue> getFormFieldsMap(String pageName,String lang);
	public List<SysPageLabelValue> getLabels(String pageName, String lang);
	public List<SysPageOptionValue> getOptions(String pageName, String lang);
	public Map<String, SysPageOptionValue> getOptionsMap(String pageName, String lang);
	public List<SysPageTextValue> getTexts(String pageName, String lang);
	public Map<String, SysPageTextValue> getTextsMap(String pageName, String lang);
	
}
