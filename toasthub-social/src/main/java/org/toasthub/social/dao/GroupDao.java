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

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.Query;

import org.toasthub.core.general.model.UserContext;
import org.toasthub.core.general.model.ajax.RestRequest;
import org.toasthub.core.general.model.ajax.RestResponse;
import org.toasthub.core.general.svc.EntityManagerSvc;
import org.toasthub.core.security.svc.Authorize;
import org.toasthub.social.model.Discussion;
import org.toasthub.social.model.DiscussionComment;
import org.toasthub.social.model.Group;
import org.toasthub.social.model.GroupJoin;
import org.toasthub.social.model.GroupPrivateInvite;
import org.toasthub.social.model.GroupPublicRequest;

@Stateless
@SuppressWarnings("unchecked")
public class GroupDao {

	@Inject UserContext login;
	@Inject EntityManagerSvc entityManagerSvc;

////////////////////////////////////// Groups ////////////////////////////////////	
	public void getGroups(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		if (request.containsParam("tab") && request.getParams().get("tab").equals(Group.MYGROUPS)){
			String HQLQuery = "SELECT g FROM Group AS g WHERE g.owner.id = :uid ORDER BY g.name ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
		} else if (request.containsParam("tab") && request.getParams().get("tab").equals(Group.JOINED)){
			String HQLQuery = "SELECT g FROM Group AS g LEFT OUTER JOIN g.joiners AS j WHERE j.id = :jid ORDER BY g.name ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("jid", login.getCurrentUser().getId());
		} else {
			String HQLQuery = "SELECT g FROM Group AS g WHERE g.owner.id <> :uid AND g.access IN(:access) AND g.id NOT IN(SELECT j.group.id FROM GroupJoin AS j WHERE j.user.id = :jid) AND g.id NOT IN(SELECT r.group.id FROM GroupPublicRequest AS r where r.sender.id = :uid) ORDER BY g.name ASC";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			query.setParameter("jid", login.getCurrentUser().getId());
			List<String> pubAccess = Arrays.asList("PUBO","PUBR");
			query.setParameter("access",pubAccess);
		}
		// groups I joined
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("groups", (List<?>) query.getResultList());
	}
	
	public void getLatestGroups(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		String HQLQuery = "FROM Group AS g WHERE g.created > :date AND g.access <> 'PRII' AND g.owner.id IN(SELECT a.acquaintance.id FROM Acquaintance as a WHERE a.user.id = :uid) ORDER BY g.created";
		query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		Date d = new Date();
		Calendar cal = Calendar.getInstance();
	    cal.setTime(d);
	    cal.add(Calendar.DAY_OF_MONTH, -1);
		query.setParameter("date", cal.getTime());
		query.setParameter("uid",login.getCurrentUser().getId());
		response.addParam("groups", (List<?>) query.getResultList());
	}

	public void getGroupCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		if (request.containsParam("tab") && request.getParams().get("tab").equals(Group.MYGROUPS)){
			String HQLQuery = "SELECT count(*) FROM Group AS g WHERE g.owner.id = :uid";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("myGroupCount", (Long) query.getSingleResult());
		} else {
			String HQLQuery = "SELECT count(*) FROM Group AS g WHERE g.owner.id <> :uid";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("groupCount", (Long) query.getSingleResult());
		}
	}

	public void getInviteCount(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = null;
		if (request.containsParam("iType") && request.getParams().get("iType").equals("SENTINVITES")){
			HQLQuery = "SELECT count(*) FROM GroupPrivateInvite AS i WHERE i.group.id IN(SELECT g.id FROM Group AS g WHERE g.owner.id = :uid)";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("sentInviteCount", (Long) query.getSingleResult());
		} else if (request.containsParam("iType") && request.getParams().get("iType").equals("RECEIVEINVITES")) {
			HQLQuery = "SELECT count(*) FROM GroupPrivateInvite AS i WHERE i.receiver.id = :uid";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("receiveInviteCount", (Long) query.getSingleResult());
		}
	}
	
	public void getRequestCount(RestRequest request, RestResponse response) throws Exception {
		Query query = null;
		if (request.containsParam("iType") && request.getParams().get("iType").equals("SENTREQUESTS")){
			String HQLQuery = "SELECT count(*) FROM GroupPublicRequest AS r WHERE r.sender.id = :uid";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("sentRequestCount", (Long) query.getSingleResult());
		} else {
			String HQLQuery = "SELECT count(*) FROM GroupPublicRequest AS r WHERE r.group.id IN(SELECT g.id FROM Group AS g WHERE g.owner.id = :uid)";
			query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid",login.getCurrentUser().getId());
			response.addParam("receiveRequestCount", (Long) query.getSingleResult());
		}
	}
	
	public void getGroup(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM Group AS g WHERE g.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("groupId")));
		response.addParam("group", (Group) query.getSingleResult());
	}
	
	@Authorize
	public void saveGroup(RestRequest request, RestResponse response) throws Exception {
		Group group = ((Group) request.getParam("group"));
		group.setOwnerRefId(login.getCurrentUser().getId());
		entityManagerSvc.getInstance().merge(group);
	}

	@Authorize
	public void deleteGroup(RestRequest request, RestResponse response) throws Exception {
		Group group = (Group) entityManagerSvc.getInstance().getReference(Group.class, new Long((Integer) request.getParam("groupId")));
		entityManagerSvc.getInstance().remove(group);
	}

	public void joinGroup(RestRequest request, RestResponse response) throws Exception {
		Group group = (Group) entityManagerSvc.getInstance().getReference(Group.class, new Long((Integer) request.getParam("groupId")));
		GroupJoin join = new GroupJoin();
		join.setGroup(group);
		join.setUserRefId(login.getCurrentUser().getId());
		entityManagerSvc.getInstance().persist(join);
	}
	
	@Authorize
	public void leaveGroup(RestRequest request, RestResponse response) throws Exception {
		Query query = entityManagerSvc.getInstance().createQuery("FROM GroupJoin as j WHERE j.group.id = :groupid AND j.user.id = :id");
		query.setParameter("groupid", new Long((Integer) request.getParam("groupId")));
		query.setParameter("id", login.getCurrentUser().getId());
		GroupJoin join = (GroupJoin) query.getSingleResult();
		entityManagerSvc.getInstance().remove(join);
		
	}
	
	@Authorize
	public void cancelPublicRequestJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPublicRequest groupPublicRequest = (GroupPublicRequest) entityManagerSvc.getInstance().getReference(GroupPublicRequest.class, new Long((Integer) request.getParam("joinId")));
		entityManagerSvc.getInstance().remove(groupPublicRequest);
	}
	
	@Authorize
	public void cancelPrivateInviteJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPrivateInvite invite = (GroupPrivateInvite) entityManagerSvc.getInstance().getReference(GroupPrivateInvite.class, new Long((Integer) request.getParam("joinId")));
		entityManagerSvc.getInstance().remove(invite);
	}
	
	public void getGroupInvites(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = null;
		if (request.containsParam("iType") && request.getParam("iType").equals("SENTINVITES")){
			HQLQuery = "SELECT NEW GroupPrivateInvite(i.id,i.status,i.message,i.receiver,i.group.name) FROM GroupPrivateInvite AS i WHERE i.group.id IN (SELECT g.id FROM Group AS g WHERE g.owner.id = :uid)";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			
			if ((Integer) request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer) request.getParam("pageStart"));
				query.setMaxResults((Integer) request.getParam("pageLimit"));
			}
			response.addParam("groupSentInvites", (List<?>) query.getResultList());
		} else if (request.containsParam("iType") && request.getParam("iType").equals("RECEIVEINVITES")){
			HQLQuery = "SELECT NEW GroupPrivateInvite(i.id,i.status,i.message,i.group.owner,i.group.name) FROM GroupPrivateInvite AS i WHERE i.receiver.id = :uid AND i.status = 'PEND'";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			
			if ((Integer) request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer) request.getParam("pageStart"));
				query.setMaxResults((Integer) request.getParam("pageLimit"));
			}
			response.addParam("groupReceiveInvites", (List<?>) query.getResultList());
		}
	}
	
	public void getGroupRequests(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = null;
		if (request.containsParam("iType") && request.getParam("iType").equals("SENTREQUESTS")){
			HQLQuery = "SELECT NEW GroupPublicRequest(r.id,r.status,r.message,r.sender,r.group.name) FROM GroupPublicRequest AS r WHERE r.sender.id = :uid";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			if ((Integer) request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer) request.getParam("pageStart"));
				query.setMaxResults((Integer) request.getParam("pageLimit"));
			}
			response.addParam("groupSentRequests", (List<?>) query.getResultList());
		} else if (request.containsParam("iType") && request.getParam("iType").equals("SENTREQUESTS")){
			HQLQuery = "SELECT NEW GroupPublicRequest(r.id,r.status,r.message,r.sender,r.group.name) FROM GroupPublicRequest AS r WHERE r.group.id IN (SELECT g.id FROM Group AS g WHERE g.owner.id = :uid) ";
			Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
			query.setParameter("uid", login.getCurrentUser().getId());
			if ((Integer) request.getParam("pageLimit") != 0){
				query.setFirstResult((Integer) request.getParam("pageStart"));
				query.setMaxResults((Integer) request.getParam("pageLimit"));
			}
			response.addParam("groupReceiveRequests", (List<?>) query.getResultList());
		}
	}
	
	public void privateInviteGroup(RestRequest request, RestResponse response) throws Exception {
		Group group = (Group) entityManagerSvc.getInstance().getReference(Group.class, new Long((Integer) request.getParam("groupId")));
		GroupPrivateInvite groupPrivateInvite = (GroupPrivateInvite) request.getParams().get("groupPrivateInvite");
		groupPrivateInvite.setGroup(group);
		groupPrivateInvite.setReceiverRefId(new Long((Integer) request.getParam("receiveId")));
		groupPrivateInvite.setStatus(GroupPrivateInvite.PEND);
		entityManagerSvc.getInstance().persist(groupPrivateInvite);
	}
	
	public void acceptPrivateInviteJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPrivateInvite invite = entityManagerSvc.getInstance().find(GroupPrivateInvite.class, new Long((Integer) request.getParam("inviteId")));
		invite.setStatus(GroupPrivateInvite.APRV);
		request.addParam("groupId", invite.getGroup().getId());
		this.joinGroup(request, response);
		entityManagerSvc.getInstance().merge(invite);
	}
	
	public void rejectPrivateInviteJoin(RestRequest request, RestResponse response) throws Exception {
		int num = entityManagerSvc.getInstance().createQuery("UPDATE GroupPrivateInvite AS i SET i.status = 'REJT' WHERE i.id = :inviteid").setParameter("inviteid", new Long((Integer) request.getParam("inviteId"))).executeUpdate();
	
	}
	
	public void deletePrivateInviteJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPrivateInvite invite = entityManagerSvc.getInstance().find(GroupPrivateInvite.class, new Long((Integer) request.getParam("inviteId")));
		entityManagerSvc.getInstance().remove(invite);
		
	}
	
	public void requestJoinGroup(RestRequest request, RestResponse response) throws Exception {
		Group group = (Group) entityManagerSvc.getInstance().getReference(Group.class, new Long((Integer) request.getParam("groupId")));
		GroupPublicRequest groupRequest = (GroupPublicRequest) request.getParams().get("groupRequest");
		groupRequest.setSenderRefId(login.getCurrentUser().getId());
		groupRequest.setGroup(group);
		groupRequest.setStatus(GroupPublicRequest.PEND);
		entityManagerSvc.getInstance().persist(groupRequest);
		
	}
	
	public void acceptPublicRequestJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPublicRequest groupPublicRequest = entityManagerSvc.getInstance().find(GroupPublicRequest.class, new Long((Integer) request.getParam("requestId")));
		groupPublicRequest.setStatus(GroupPublicRequest.APRV);
		GroupJoin join = new GroupJoin();
		join.setGroup(groupPublicRequest.getGroup());
		join.setUserRefId(groupPublicRequest.getSenderRefId());
		entityManagerSvc.getInstance().persist(join);
		entityManagerSvc.getInstance().merge(groupPublicRequest);
	}
	
	public void rejectPublicRequestJoin(RestRequest request, RestResponse response) throws Exception {
		int num = entityManagerSvc.getInstance().createQuery("UPDATE GroupPublicRequest AS r SET r.status = 'REJT' WHERE r.id = :requestid")
				.setParameter("requestid", new Long((Integer) request.getParam("requestId"))).executeUpdate();
		
	}
	
	public void deletePublicRequestJoin(RestRequest request, RestResponse response) throws Exception {
		GroupPublicRequest groupPublicRequest = entityManagerSvc.getInstance().find(GroupPublicRequest.class, new Long((Integer) request.getParam("requestId")));
		entityManagerSvc.getInstance().remove(groupPublicRequest);
	}
//////////////////////////////////////////  Discussions //////////////////////////////////////
	
	
	public void getDiscussionCount(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT count(*) FROM Discussion AS d WHERE d.group.id = :groupid";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("groupid",new Long((Integer) request.getParam("groupId")));
		response.addParam("discussionCount", (Long) query.getSingleResult());
	}
	
	public void getDiscussions(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT NEW Discussion(d.id,d.subject,d.messageShort,d.owner) FROM Discussion AS d WHERE d.group.id = :groupid ORDER BY d.created DESC";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("groupid", new Long((Integer) request.getParam("groupId")));
		if ((Integer) request.getParam("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("discussions", (List<?>) query.getResultList());
	}
	
	public void getDiscussion(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM Discussion AS d WHERE d.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("discussionId")));
		response.addParam("discussionComment", (Discussion) query.getSingleResult());
	}
	
	public void getDiscussionMessage(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT NEW Discussion(d.id,d.messageShort,d.message) FROM Discussion AS d WHERE d.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("discussionId")));
		response.addParam("discussionMessage", (Discussion) query.getSingleResult());
	}
	
	@Authorize
	public void saveDiscussion(RestRequest request, RestResponse response) throws Exception {
		Discussion discussion = (Discussion) request.getParam("discussion");
		discussion.setOwnerRefId(login.getCurrentUser().getId());
		Group group = (Group) entityManagerSvc.getInstance().getReference(Group.class, new Long((Integer) request.getParam("groupId")));
		discussion.setGroup(group);
		entityManagerSvc.getInstance().merge(discussion);
	}

	@Authorize
	public void deleteDiscussion(RestRequest request, RestResponse response) throws Exception {
		Discussion discussion = (Discussion) entityManagerSvc.getInstance().getReference(Discussion.class, new Long((Integer) request.getParam("discussionId")));
		entityManagerSvc.getInstance().remove(discussion);
	}
	
/////////////////////////////////////////  Discussion Comments ///////////////////////////////////	
	
	public void getCommentCount(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT count(*) FROM DiscussionComment AS c WHERE c.discussion.id = :discussionid";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("discussionid",new Long((Integer) request.getParam("discussionId")));
		response.addParam("commentCount", (Long) query.getSingleResult());
	}
	
	public void getDiscussionComments(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT NEW DiscussionComment(c.id,c.messageShort,c.owner) FROM DiscussionComment AS c WHERE c.discussion.id = :discussionid ORDER BY c.created DESC";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("discussionid", new Long((Integer) request.getParam("discussionId")));
		if ((Integer) request.getParams().get("pageLimit") != 0){
			query.setFirstResult((Integer) request.getParam("pageStart"));
			query.setMaxResults((Integer) request.getParam("pageLimit"));
		}
		response.addParam("discussionComments", (List<?>) query.getResultList());
	}
	
	public void getDiscussionComment(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "FROM DiscussionComment AS c WHERE c.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("commentId")));
		response.addParam("discussionComments", (DiscussionComment) query.getSingleResult());
	}
	
	public void getCommentMessage(RestRequest request, RestResponse response) throws Exception {
		String HQLQuery = "SELECT NEW DiscussionComment(c.id,c.messageShort,c.message) FROM DiscussionComment AS c WHERE c.id = :id";
		Query query = entityManagerSvc.getInstance().createQuery(HQLQuery);
		query.setParameter("id",new Long((Integer) request.getParam("commentId")));
		response.addParam("commentMessage", (DiscussionComment) query.getSingleResult());
	}
	
	@Authorize
	public void saveDiscussionComment(RestRequest request, RestResponse response) throws Exception {
		DiscussionComment comment = (DiscussionComment) request.getParam("comment");
		comment.setOwnerRefId(login.getCurrentUser().getId());
		Discussion discussion = (Discussion) entityManagerSvc.getInstance().getReference(Discussion.class, new Long((Integer) request.getParam("discussionId")));
		comment.setDiscussion(discussion);
		entityManagerSvc.getInstance().merge(comment);
	}

	@Authorize
	public void deleteDiscussionComment(RestRequest request, RestResponse response) throws Exception {
		int deletedEntities = entityManagerSvc.getInstance().createQuery("DELETE DiscussionComment as c WHERE c.id = :id")
				.setParameter("id", new Long((Integer) request.getParam("commentId"))).executeUpdate();
		if (deletedEntities == 0){
			throw new Exception("Nothing deleted verify your id");
		}
	}
}
