package org.toasthub.admin.system.dao;

import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.system.dao.UsersDaoIface;

public interface UsersAdminDaoIface extends UsersDaoIface {

	public void save(RestRequest request, RestResponse response) throws Exception;
	public void delete(RestRequest request, RestResponse response) throws Exception;
	public void disable(RestRequest request, RestResponse response) throws Exception;
	public void saveRole(RestRequest request, RestResponse response) throws Exception;
	public void deleteRole(RestRequest request, RestResponse response) throws Exception;
}
