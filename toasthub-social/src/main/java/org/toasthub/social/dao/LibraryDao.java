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

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.Directory;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.security.svc.Authorize;

@Stateless
@SuppressWarnings("unchecked")
public class LibraryDao {

	@Inject UserContext login;
	@Inject EntityManagerSvc entityManagerSvc;

	public void getDirectories(RestRequest request, RestResponse response){
		Long parentId = null;
		if (request.containsParam("parentId") && request.getParam("parentId") != null){
			parentId =new Long((Integer) request.getParam("parentId"));
		}
		Query query = null;
		if (request.getParam("iType").equals(Directory.MINE)){
			String HQLQuery = "FROM Directory AS d WHERE ";
			if (parentId == null || parentId == 0){
				HQLQuery += "d.parent IS NULL ";
			} else {
				HQLQuery += "d.parent.id = :parent ";
			}
			HQLQuery += "AND d.owner.id = :id ORDER BY d.name ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			
			if ( parentId != null){
				query.setParameter("parent",parentId);
			}
			if ((Integer) request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer) request.getParam("pageStart"));
				query.setMaxResults((Integer) request.getParam("pageLimit"));
			}
			
			query.setParameter("id",login.getCurrentUser().getId());
		} else {
			
		}
		response.addParam("directories", (List<?>) query.getResultList());
	}
	
	public void getDirectory(RestRequest request, RestResponse response){
		String HQLQuery = "FROM Directory AS d WHERE d.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("directoryId")));
		response.addParam("group", (Directory) query.getSingleResult());
	}
	
	@Authorize
	public void saveDirectory(RestRequest request, RestResponse response) throws Exception {
		Object d = request.getParam("directory");
		
		Directory directory = new Directory();
		Long parentId = new Long((Integer) request.getParam("parentId"));
		directory.setOwnerRefId(login.getCurrentUser().getId());
		if (parentId != null){
			Directory parentDir = (Directory) entityManagerSvc.getInstance().getReference(Directory.class, parentId);
			directory.setParent(parentDir);
		}
		//entityManagerSvc.getInstance().merge(directory);
	}

	@Authorize
	public void deleteDirectory(RestRequest request, RestResponse response) throws Exception {
		Directory directory = (Directory) entityManagerSvc.getInstance().getReference(Directory.class, new Long((Integer) request.getParam("directoryId")));
		entityManagerSvc.getInstance().remove(directory);
	}
	
	public void getDirectoryCount(RestRequest request, RestResponse response) {
		Long parentId = null;
		if (request.containsParam("parentId") && request.getParam("parentId") != null){
			parentId =new Long((Integer) request.getParam("parentId"));
		}
		Query query = null;
		if (request.containsParam("iType") && request.getParam("iType").equals(Directory.MINE)){
			String HQLQuery = "SELECT count(*) FROM Directory AS d WHERE ";
			if (parentId == null || parentId == 0){
				HQLQuery += "d.parent IS NULL ";
			} else {
				HQLQuery += "d.parent.id = :parent ";
			}
			HQLQuery += "AND d.owner.id = :uid";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			if (parentId != null){
				query.setParameter("parent",parentId);
			}
			query.setParameter("uid",login.getCurrentUser().getId());
		} else {
			String HQLQuery = "SELECT count(*) FROM Directory AS d WHERE d.owner.id <> :uid";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
		}
		
		response.addParam("dirCount", (Long) query.getSingleResult());
	}
	
	//////////////////////////////////// File
	
	public void getFileCount(RestRequest request, RestResponse response) {
		Long parentId = new Long((Integer) request.getParam("parentId"));
		Query query = null;
		if (request.getParam("iType").equals(Directory.MINE) && parentId > 0){
			String HQLQuery = "SELECT count(*) FROM AttachmentMeta AS a WHERE a.directory.id = :parentid ";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("parentid",parentId);
		} else if (request.getParam("iType").equals(Directory.SHARED) && parentId > 0) {
			String HQLQuery = "SELECT count(*) FROM AttachmentMeta AS a WHERE a.directory.id = :parentid ";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("parentid",parentId);
			query.setParameter("id",login.getCurrentUser().getId());
		} 
		response.addParam("fileCount", (Long) query.getSingleResult());
	}
	
	public void getFiles(RestRequest request, RestResponse response){
		Long parentId = new Long((Integer) request.getParam("parentId"));
		Query query = null;
		if (request.getParam("iType").equals(Directory.MINE) && parentId > 0){
			String HQLQuery = "FROM AttachmentMeta AS a WHERE a.directory.id = :parentid ORDER BY a.title ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("parentid",parentId);
		} else if (request.getParam("iType").equals(Directory.SHARED) && parentId > 0) {
			String HQLQuery = "FROM AttachmentMeta AS a WHERE a.directory.id = :parentid ORDER BY a.title ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("parentid",parentId);
		} 
		response.addParam("directories", (List<?>) query.getResultList());
	}
}
