package org.toasthub.core.general.svc;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;

public interface WorkFlowSvcIface {

	public void item(RestRequest request, RestResponse response);
	public void items(RestRequest request, RestResponse response);
	public void itemCount(RestRequest request, RestResponse response);
	
}
