
<%@ page import="cocorahs.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:stylesheet src="mystyle.css"/>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:render template="/navbar"/>
		<div id="show-post" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list post">
			
			    <g:if test="${postInstance?.station}">
				<li class="fieldcontain">
					<span id="station-label" class="property-label"><g:message code="post.station.label" default="Station" /></span>
					
						<span class="property-value" aria-labelledby="station-label"><g:link controller="station" action="show" id="${postInstance?.station?.id}">${postInstance?.station?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${postInstance?.timeStamp}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label">
					    <g:message code="post.timeStamp.label" default="Time Stamp" />
					</span>
					<span class="property-value" aria-labelledby="timeStamp-label">
					    <g:fieldValue bean="${postInstance}" field="timeStamp"/>
					</span>
				</li>
				</g:if>
				
				<g:if test="${postInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="post.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${postInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postInstance?.photo_a}">
				<li class="fieldcontain">
					<span id="photo_a-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_A', id:"${postInstance.id}")}">
				</li>
				</g:if>
				
				<g:if test="${postInstance?.photo_b}">
				<li class="fieldcontain">
					<span id="photo_b-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo: Sky" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_B', id:"${postInstance.id}")}">
				</li>
				</g:if>
				
				<g:if test="${postInstance?.photo_c}">
				<li class="fieldcontain">
					<span id="photo_c-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo: North" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_C', id:"${postInstance.id}")}">
				</li>
				</g:if>
				
				<g:if test="${postInstance?.photo_d}">
				<li class="fieldcontain">
					<span id="photo_d-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo: South" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_D', id:"${postInstance.id}")}">
				</li>
				</g:if>
				
				<g:if test="${postInstance?.photo_e}">
				<li class="fieldcontain">
					<span id="photo_e-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo: East" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_E', id:"${postInstance.id}")}">
				</li>
				</g:if>
				
				<g:if test="${postInstance?.photo_f}">
				<li class="fieldcontain">
					<span id="photo_f-label" class="property-label">
					    <g:message code="post.photo.label" default="Photo: West" />
					</span>
					<img alt="Missing Cover" src="${createLink(controller:'post', action:'showPhoto_F', id:"${postInstance.id}")}">
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:postInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
    </div>
	</body>
</html>
