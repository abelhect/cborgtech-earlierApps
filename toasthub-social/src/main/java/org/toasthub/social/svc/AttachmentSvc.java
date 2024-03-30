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

package org.toasthub.social.svc;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.commons.io.IOUtils;
import org.jboss.resteasy.plugins.providers.multipart.InputPart;
import org.jboss.resteasy.plugins.providers.multipart.MultipartFormDataInput;
import org.toasthub.core.general.model.Attachment;
import org.toasthub.core.general.model.AttachmentMeta;
import org.toasthub.core.general.model.AttachmentThumbnail;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.model.handler.ServiceProcessor;
import org.toasthub.core.general.svc.UtilSvc;
import org.toasthub.social.dao.AttachmentDao;

@RequestScoped
public class AttachmentSvc implements ServiceProcessor{

	@Inject	AttachmentDao attachmentDao;
	@Inject UtilSvc utilSvc;
	
	public void process(RestRequest request, RestResponse response) {
		
		String action = (String) request.getParam("action");
		
		switch (action) {
		case "UPLOAD": 
			MultipartFormDataInput input = (MultipartFormDataInput) request.getParam("multipartFormDataInput");
			String fileName = "";
			String contentType = "txt";
			String parentId = "";
			String comment = null;
			input.getParts();
			Map<String, List<InputPart>> uploadForm = input.getFormDataMap();
			try {
				parentId = uploadForm.get("id").get(0).getBodyAsString();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			Long id = Long.parseLong(parentId);
			List<InputPart> inputFiles = uploadForm.get("uploadedFile");
			try {
				comment = uploadForm.get("comment").get(0).getBodyAsString();
			} catch (IOException e1) {
			}
			for (InputPart inputPart : inputFiles) {
				try {
					MultivaluedMap<String, String> header = inputPart.getHeaders();
					//fileName = utilSvc.getFileName(header);
					contentType = utilSvc.getContentType(header);
	 
					//convert the uploaded file to inputstream
					InputStream inputStream = inputPart.getBody(InputStream.class,null);
					// Full res attachment
					byte[] fullResBytes = IOUtils.toByteArray(inputStream);
					
					byte[] thumbNailBytes = null;
					if (contentType.equals("image/jpeg")){
						// create thumbnail
						thumbNailBytes = utilSvc.createThumbNail(fullResBytes);
					}
					
					Attachment attachmentData = new Attachment(fullResBytes);
					AttachmentMeta attachmentMeta = new AttachmentMeta(fileName,fileName,null,fullResBytes.length,contentType,attachmentData);
					if (thumbNailBytes != null){
						AttachmentThumbnail thumbNail = new AttachmentThumbnail(thumbNailBytes);
						attachmentMeta.setThumbNail(thumbNail);
					}
					if (comment != null){
						attachmentMeta.setComment(comment);
					}
					request.addParam("attachmentMeta", attachmentMeta);
					request.addParam("metaId", id);
					this.save(request, response);
					inputStream.close();
				} catch (IOException e) {
					utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "File upload failed",response);
					e.printStackTrace();
				}
			}
			break;
		case "DOWNLOAD":
			
			break;
		}
	}
	
	
	protected void save(RestRequest request, RestResponse response) {
		try {
			attachmentDao.save(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public AttachmentMeta getAttachmentMeta(Long metaId) {
		return attachmentDao.getAttachmentMeta(metaId);
	}
	
	public AttachmentMeta getAttachment(Long metaId) {
		return attachmentDao.getAttachment(metaId);
	}
	
	public AttachmentMeta getThumbNail(Long metaId) {
		return attachmentDao.getThumbNail(metaId);
	}
	
	
	protected RestResponse delete(Long metaId){
		RestResponse response = new RestResponse();
		try {
			attachmentDao.delete(metaId);
			utilSvc.addStatus(RestResponse.INFO, RestResponse.SUCCESS, "Delete Successful", response);
		} catch (Exception e) {
			utilSvc.addStatus(RestResponse.ERROR, RestResponse.ACTIONFAILED, "Delete Failed", response);
			e.printStackTrace();
		}
		return response;
	}


}
