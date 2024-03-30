package org.toasthub.admin.system.svc;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.system.svc.UsersSvcIface;

public interface UsersAdminSvcIface extends UsersSvcIface {

	public void disable(RestRequest request, RestResponse response);
	public void delete(RestRequest request, RestResponse response);
	public void save(RestRequest request, RestResponse response);
	void saveRole(RestRequest request, RestResponse response);
	void deleteRole(RestRequest request, RestResponse response);
}
