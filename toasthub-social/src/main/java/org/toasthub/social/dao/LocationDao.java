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

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.Stateless;
import javax.persistence.Query;

import org.toasthub.core.general.model.AttachmentMeta;
import org.toasthub.core.general.model.Directory;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.social.model.Location;

@LocationDaoQual
@Stateless
public class LocationDao extends BaseDao implements LocationDaoIface {

	public LocationDao() {
		super();
	}

	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		String queryStr = "SELECT COUNT(*) FROM Location l WHERE l.ownerRefId = :id ";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("id",login.getCurrentUser().getId());
		Long count = (Long) query.getSingleResult();
		if (count == null){
			count = 0l;
		}
		response.addParam("count", count);
	}

	public void items(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		String queryStr = "FROM Location l WHERE l.ownerRefId = :id ORDER BY l.created DESC ";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("id",login.getCurrentUser().getId());
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("items", (List<?>) query.getResultList());
	}

	public void item(RestRequest request, RestResponse response) throws Exception {
		if ( (Boolean) request.getParam("currentLocation") ){
			Location location = (Location) entityManagerSvc.getInstance().createQuery("FROM Location l WHERE max(l.created)").getSingleResult();
			response.addParam("currentItem", location);
		} else {
			Location location = (Location) entityManagerSvc.getInstance().createQuery("FROM Location l WHERE l.id = :id")
				.setParameter("id",  new Long((Integer) request.getParam("id")) ).getSingleResult();
			if (location != null) {
				response.addParam("item", location);
			} else {
				utilSvc.addStatus(RestResponse.INFO, RestResponse.DOESNOTEXIST, "Location id does not exist", response);
			}
		}
	}
	
	public void save(RestRequest request, RestResponse response) throws Exception {
		Location location = (Location) request.getParam("location");
		location.setOwnerRefId(login.getCurrentUser().getId());
		entityManagerSvc.getInstance().merge(location);
	}
	
	public void delete(RestRequest request, RestResponse response) throws Exception {
		Location location = (Location) entityManagerSvc.getInstance().find(Location.class, new Long((Integer) request.getParam("id")));
		if (location.getOwnerRefId().equals(login.getCurrentUser().getId())){
			entityManagerSvc.getInstance().remove(location);
		}
	}

	@Override
	public void saveAttachment(RestRequest request, RestResponse response) throws Exception {
		AttachmentMeta attachment = (AttachmentMeta) request.getParam("attachment");
		Long id = new Long((Integer) request.getParam("fuLocationId"));
		attachment.setUserRefId(login.getCurrentUser().getId());
		Directory directory = null;
		try {
			directory = (Directory) entityManagerSvc.getInstance().createQuery("FROM Directory AS d WHERE d.name = :name").setParameter("name","FULOCATION").getSingleResult();
		} catch (Exception e) {
			// no directory found 
		}
		if (directory == null){
			Directory myDir = new Directory("FULOCATION",login.getCurrentUser().getId());
			attachment.setDirectory(myDir);
		} else {
			attachment.setDirectory(directory);
		}
		// add 
		if (id.equals(0L) || id.equals(null)){
			//Draft
			Location fuLocation = new Location();
			fuLocation.setOwnerRefId(login.getCurrentUser().getId());
			Set<AttachmentMeta> images = new HashSet<AttachmentMeta>();
			images.add(attachment);
			fuLocation.setImages(images);
			entityManagerSvc.getInstance().persist(fuLocation);
			response.addParam("fuLocationId", fuLocation.getId());
		} else {
			Location fuLocation = (Location) entityManagerSvc.getInstance().getReference(Location.class, id);
			fuLocation.getImages().add(attachment);
			entityManagerSvc.getInstance().merge(fuLocation);
			response.addParam("fuLocationId", id);
		}
		
	}

	@Override
	public void deleteAttachment(RestRequest request, RestResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}


	public void getAcquaintanceLocations(RestRequest request, RestResponse response) throws Exception {
		@SuppressWarnings("unchecked")
		Long x = login.getCurrentUser().getId();
		String queryStr = "SELECT new Location(l.id, l.ownerRefId, l.latitude, l.longitude, l.altitude, l.accuracy, l.provider, max(l.created)) FROM Location as l WHERE l.ownerRefId in (SELECT a.acquaintance.id FROM Acquaintance as a WHERE a.userRefId = :uid)  GROUP BY l.ownerRefId ";
		Query query = entityManagerSvc.getInstance().createQuery(queryStr);
		query.setParameter("uid",login.getCurrentUser().getId());
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("items", (List<?>) query.getResultList());
		
	}

}
