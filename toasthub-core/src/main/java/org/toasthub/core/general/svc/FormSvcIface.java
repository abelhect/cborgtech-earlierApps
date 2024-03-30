package org.toasthub.core.general.svc;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

public interface FormSvcIface {

	public void getForm(RestRequest request, RestResponse response);
	public void getForms(RestRequest request, RestResponse response);
	public void getFormCount(RestRequest request, RestResponse response);
	
}
