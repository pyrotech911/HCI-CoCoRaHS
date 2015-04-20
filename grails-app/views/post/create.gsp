<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
        <script>window.onload = function(){initGeolocation()}</script>
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="mystyle.css"/>
        <asset:javascript src="geolocation.js"/>
	</head>
	<body>
    <g:set var="navTitle" value="Update Post" scope="request"/>
    <g:render template="/navbar"/>
    <div class="map" id="map" style="width:100%;height:400px;"></div>
		<div id="create-post" class="content scaffold-create" role="main">
			<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<g:hasErrors bean="${postInstance}">
			    <ul class="errors" role="alert">
				    <g:eachError bean="${postInstance}" var="error">
				         <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
			    </ul>
			</g:hasErrors>
			<g:form url="[resource:postInstance, action:'save']" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
%{--id:postInstance?.stationId--}%
%{--enctype="multipart/form-data"--}%
