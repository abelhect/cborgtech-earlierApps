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

package org.toasthub.social.dao;

import javax.inject.Inject;

import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.general.svc.UtilSvc;

public abstract class BaseDao implements BaseDaoIface {

	@Inject	protected UserContext login;
	@Inject	protected EntityManagerSvc entityManagerSvc;
	@Inject protected UtilSvc utilSvc;
	
	public BaseDao(){
	}
	/*
	public AttachmentMeta getAttachmentMeta(Long metaId) {
		AttachmentMeta attachmentMeta = (AttachmentMeta) entityManagerSvc.getInstance().createQuery("SELECT NEW AttachmentMeta(a.id,a.title,a.fileName,a.filePath,a.size,a.contentType) FROM AttachmentMeta a WHERE a.id = :id").setParameter("id",metaId).getSingleResult();
		return attachmentMeta;
	}
	
	public AttachmentMeta getAttachment(Long id) {
		AttachmentMeta attachmentMeta = (AttachmentMeta) entityManagerSvc.getInstance().createQuery("FROM AttachmentMeta a INNER JOIN FETCH a.data WHERE a.id = :id").setParameter("id",id).getSingleResult();
		return attachmentMeta;
	}
	*/
	public abstract void saveAttachment(RestRequest request, RestResponse response) throws Exception;
	
	public abstract void deleteAttachment(RestRequest request, RestResponse response) throws Exception;
}
