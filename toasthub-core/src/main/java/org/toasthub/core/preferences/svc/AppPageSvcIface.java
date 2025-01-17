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

import org.toasthub.core.general.model.AppPageFormFieldValue;
import org.toasthub.core.general.model.AppPageLabelValue;
import org.toasthub.core.general.model.AppPageName;
import org.toasthub.core.general.model.AppPageOptionValue;
import org.toasthub.core.general.model.AppPageTextValue;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

public interface AppPageSvcIface {

	public AppPageName getPageName(Long id);
	public AppPageName getPageName(String name);
	public List<AppPageFormFieldValue> getFormFields(String pageName, String lang);
	public Map<String, AppPageFormFieldValue> getFormFieldsMap(String pageName,String lang);
	public List<AppPageLabelValue> getLabels(String pageName, String lang);
	public List<AppPageOptionValue> getOptions(String pageName, String lang);
	public Map<String, AppPageOptionValue> getOptionsMap(String pageName, String lang);
	public List<AppPageTextValue> getTexts(String pageName, String lang);
	public Map<String, AppPageTextValue> getTextsMap(String pageName, String lang);
	
	public void itemCount(RestRequest request, RestResponse response);
	public void items(RestRequest request, RestResponse response);
	public void item(RestRequest request, RestResponse response);
}
