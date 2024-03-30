package org.toasthub.admin.svc;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.FormSvcIface;

public interface FormAdminSvcIface extends FormSvcIface {

	public void deleteForm(RestRequest request, RestResponse response);
	public void saveForm(RestRequest request, RestResponse response);
	
}
