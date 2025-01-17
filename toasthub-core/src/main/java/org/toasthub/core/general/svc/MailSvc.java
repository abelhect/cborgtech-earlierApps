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

package org.toasthub.core.general.svc;

import java.io.Serializable;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.toasthub.core.general.dao.MailDao;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;


@RequestScoped
public class MailSvc implements Serializable {

	@Inject
	MailDao mailDao;
	
	private static final long serialVersionUID = 1L;
	
	public void sendEmailConfirmation(String email, String urlParams) throws Exception{
		mailDao.sendMailTLS(email, urlParams);
	}
	
	public void sendEmailPasswordReset(String username, String email, String password) throws Exception{
		mailDao.sendEmailPasswordReset(username, email, password);
	}
	
	public void sendEmailInvite(RestRequest request, RestResponse response) throws Exception{
		mailDao.sendEmailInvite(request, response);
	}

	public void sendEmailNotification(String username, String email, String message) throws Exception {
		mailDao.sendEmailNotification(username, email, message);
	}
}
