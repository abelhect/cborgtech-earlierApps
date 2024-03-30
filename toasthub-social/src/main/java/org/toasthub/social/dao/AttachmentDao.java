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

import javax.ejb.Stateless;
import javax.inject.Inject;

import org.toasthub.core.general.model.AttachmentMeta;
import org.toasthub.core.general.model.Directory;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.security.svc.Authorize;


@Stateless
public class AttachmentDao {

	@Inject	protected UserContext login;
	@Inject	protected EntityManagerSvc entityManagerSvc;
	
	public AttachmentMeta getAttachmentMeta(Long metaId) {
		AttachmentMeta attachmentMeta = (AttachmentMeta) entityManagerSvc.getInstance().createQuery("SELECT NEW AttachmentMeta(a.id,a.title,a.fileName,a.filePath,a.size,a.contentType) FROM AttachmentMeta a WHERE a.id = :id").setParameter("id",metaId).getSingleResult();
		return attachmentMeta;
	}
	
	public AttachmentMeta getAttachment(Long id) {
		AttachmentMeta attachmentMeta = (AttachmentMeta) entityManagerSvc.getInstance().createQuery("FROM AttachmentMeta a INNER JOIN FETCH a.data WHERE a.id = :id").setParameter("id",id).getSingleResult();
		return attachmentMeta;
	}
	
	public AttachmentMeta getThumbNail(Long id) {
		AttachmentMeta attachmentMeta = (AttachmentMeta) entityManagerSvc.getInstance().createQuery("FROM AttachmentMeta a LEFT OUTER JOIN FETCH a.thumbNail WHERE a.id = :id").setParameter("id",id).getSingleResult();
		return attachmentMeta;
	}
	
	@Authorize
	public void delete(Long metaId) throws Exception {
		AttachmentMeta meta = (AttachmentMeta) entityManagerSvc.getInstance().find(AttachmentMeta.class, metaId);
		if (meta.getUserRefId().equals(login.getCurrentUser().getId())){
			entityManagerSvc.getInstance().remove(meta);
		}
	}
	
	@Authorize
	public void save(RestRequest request, RestResponse response) throws Exception {
		AttachmentMeta attachment = (AttachmentMeta) request.getParam("attachmentMeta");
		Long id = new Long((Integer) request.getParam("id"));
		attachment.setUserRefId(login.getCurrentUser().getId());
		Directory directory = null;
		try {
			directory = (Directory) entityManagerSvc.getInstance().createQuery("FROM Directory AS d WHERE d.name = :name")
					.setParameter("name",(String)request.getParam("directoryName")).getSingleResult();
		} catch (Exception e) {
			// no directory found 
		}
		if (directory == null){
			Directory myDir = new Directory((String)request.getParam("directoryName"),login.getCurrentUser().getId());
			attachment.setDirectory(myDir);
		} else {
			attachment.setDirectory(directory);
		}
		// add to Bottle
	/*	if (id.equals(0L) || id.equals(null)){
			//Draft
			Bottle bottle = new Bottle();
			bottle.setDraft(true);
			bottle.setOwner(user);
			Set<AttachmentMeta> images = new HashSet<AttachmentMeta>();
			images.add(attachment);
			bottle.setImages(images);
			entityManagerSvc.getInstance().persist(bottle);
			response.addParam("bottleId", bottle.getId());
		} else {
			Bottle bottle = (Bottle) entityManagerSvc.getInstance().getReference(Bottle.class, id);
			bottle.getImages().add(attachment);
			entityManagerSvc.getInstance().merge(bottle);
			response.addParam("bottleId", id);
		}*/
	}
	
}
