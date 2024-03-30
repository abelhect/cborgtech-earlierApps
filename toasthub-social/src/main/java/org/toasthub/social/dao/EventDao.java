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

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.AttachmentMeta;
import org.toasthub.core.general.model.BaseEntity;
import org.toasthub.core.general.model.Directory;
import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.social.model.Event;

@EventDaoQual
@Stateless
public class EventDao extends BaseDao implements EventDaoIface {

	@Inject UserContext login;
	@Inject EntityManagerSvc entityManagerSvc;

	public void item(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM Event WHERE id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id", new Long((Integer) request.getParam("id")));
		response.addParam("item", (Event) query.getSingleResult());
	}

	public void itemCount(RestRequest request, RestResponse response) throws Exception {
		Long count = 0l;
		String HQLQuery = "SELECT count(*) FROM Event AS e WHERE e.active = :active AND (e.owner.id = :uid ";
		HQLQuery += "OR e.owner.id in (SELECT a.acquaintance.id FROM Acquaintance as a WHERE a.user.id = :uid)) ";
		if (request.getParam(BaseEntity.SEARCHVALUE) != null && !((String)request.getParam(BaseEntity.SEARCHVALUE)).isEmpty()){
			HQLQuery += "AND e.message like :searchValue ";
		}
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid", login.getCurrentUser().getId());
		if (request.containsParam("active")) {
			query.setParameter("active", request.getParam("active"));
		} else {
			query.setParameter("active", true);
		}
		if (request.getParam(BaseEntity.SEARCHVALUE) != null && !((String)request.getParam(BaseEntity.SEARCHVALUE)).isEmpty()){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE))+"%");
		}
		count = (Long)	query.getSingleResult();
		response.addParam("count", (Long) query.getSingleResult());
	}

	public void items(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM Event AS e WHERE e.active = :active AND (e.owner.id = :uid ";
		HQLQuery += "OR e.owner.id in (SELECT a.acquaintance.id FROM Acquaintance as a WHERE a.user.id = :uid)) ";
		if (request.getParam(BaseEntity.SEARCHVALUE) != null && !((String)request.getParam(BaseEntity.SEARCHVALUE)).isEmpty()){
			HQLQuery += "AND e.message like :searchValue ";
		}
		HQLQuery += "ORDER BY e.created DESC ";
		
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid", login.getCurrentUser().getId());
		if (request.containsParam("active")) {
			query.setParameter("active", request.getParam("active"));
		} else {
			query.setParameter("active", true);
		}
		if (request.getParam(BaseEntity.SEARCHVALUE) != null && !((String)request.getParam(BaseEntity.SEARCHVALUE)).isEmpty()){
			query.setParameter("searchValue", "%"+((String)request.getParam(BaseEntity.SEARCHVALUE))+"%");
		}
		if ((Integer) request.getParam(BaseEntity.PAGELIMIT) != 0){
			query.setFirstResult((Integer) request.getParam(BaseEntity.PAGESTART));
			query.setMaxResults((Integer) request.getParam(BaseEntity.PAGELIMIT));
		}
		List<Event> events = (List<Event>) query.getResultList();
		if (request.containsParam("includeImages") && "LISTID".equals(request.getParam("includeImages"))) {
			for (Event e : events){
				Query queryImage = entityManagerSvc.getInstance().createQuery("SELECT e.attachment.id FROM EventAttachment as e WHERE e.event.id = :id");
				queryImage.setParameter("id", e.getId());
				e.setImageIdList((List<Long>) queryImage.getResultList());
			}
		}
		
		response.addParam("events", events);
	}
	
	public void save(RestRequest request, RestResponse response) throws Exception {
		Event event = (Event) request.getParam("event");
		event.setOwnerRefId(login.getCurrentUser().getId());
		Event e = entityManagerSvc.getInstance().merge(event);
		request.addParam("event", e);
		request.addParam("eventId", e.getId());
	}

	public void delete(RestRequest request, RestResponse response) throws Exception {
		Event event = (Event) entityManagerSvc.getInstance().getReference(Event.class, new Long((Integer) request.getParam("id")));
		entityManagerSvc.getInstance().remove(event);
	}


	@Override
	public void saveAttachment(RestRequest request, RestResponse response) throws Exception {
		AttachmentMeta attachment = (AttachmentMeta) request.getParam("attachmentMeta");
		Long id = Long.parseLong((String) request.getParam("eventId"));
		attachment.setUserRefId(login.getCurrentUser().getId());
		Directory directory = null;
		try {
			directory = (Directory) entityManagerSvc.getInstance().createQuery("FROM Directory AS d WHERE d.name = :name").setParameter("name","EVENT").getSingleResult();
		} catch (Exception e) {
			// no directory found 
		}
		if (directory == null){
			Directory myDir = new Directory("EVENT",login.getCurrentUser().getId());
			attachment.setDirectory(myDir);
		} else {
			attachment.setDirectory(directory);
		}
		// add 
		Event event = (Event) entityManagerSvc.getInstance().getReference(Event.class, id);
		if (event.getImages() == null){
			event.setImages(new HashSet<AttachmentMeta>());
		}
		event.getImages().add(attachment);
		entityManagerSvc.getInstance().merge(event);
	}

	@Override
	public void deleteAttachment(RestRequest request, RestResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	public void getThumbNail(RestRequest request, RestResponse response) throws Exception {	
		String HQLQuery = "FROM AttachmentMeta as a inner join fetch a.thumbNail WHERE a.id = :id";
		
		if (request.containsParam("imageIdList")) {
			List<AttachmentMeta> thumbNails = new ArrayList<AttachmentMeta>();
			List<String> imageIdList = (List<String>) request.getParam("imageIdList");
			for(String id : imageIdList){
				Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
				query.setParameter("id", Long.parseLong((String)request.getParam("imageId")));
				thumbNails.add((AttachmentMeta) query.getSingleResult());
			}
			response.addParam("attachments", thumbNails);
		} else {
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("id", Long.parseLong((String)request.getParam("imageId")));
			response.addParam("attachment", (AttachmentMeta) query.getSingleResult());
		}
	}

	public void eventCheck(RestRequest request, RestResponse response) throws Exception {	
		Date d = new Date();
		Calendar cal = Calendar.getInstance();
	    cal.setTime(d);
	    cal.add(Calendar.MINUTE, -240);
		
		String HQLQuery = "SELECT e.id FROM Event AS e WHERE e.active = :active AND ";
		HQLQuery += "e.owner.id in (SELECT a.acquaintance.id FROM Acquaintance as a WHERE a.user.id = :uid) AND e.created > :fromdate ";
		HQLQuery += "ORDER BY e.created DESC ";
		
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("uid", login.getCurrentUser().getId());
		query.setParameter("fromdate", cal.getTime());
		if (request.containsParam("active")) {
			query.setParameter("active", request.getParam("active"));
		} else {
			query.setParameter("active", true);
		}
		
		List<Long> events = (List<Long>) query.getResultList();
		
		
		response.addParam("events", events);
	}
}
