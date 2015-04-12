<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'photo.label', default: 'Photo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul class="nav navbar-nav navbar-left">
            <li><button onclick="goBack()" class="back"><img src="/cocorahs/assets/site/BackButton.svg" height="50" width="80"></button></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="${createLink(uri: '')}">
                <img src="/cocorahs/assets/site/HelpButton.svg" height="50" width="80">
            </a></li>
        </ul>
    </div>


    %{--<div id="create-photo" class="content scaffold-create" role="main">--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${photoInstance}">
            <ul class="errors" role="alert">
			    <g:eachError bean="${photoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
            </ul>
		</g:hasErrors>

        <g:form url="[resource:photoInstance, action:'save']" enctype="multipart/form-data">
            <fieldset class="form">
                <g:render template="form"/>
			</fieldset>
            <div class="subButton" >
                <g:submitButton name="create" class="save" value="Upload" style="background-color: #838384;border: none; height:40px; width:250px; color: #ffffff"/>
            </div>
        </g:form>
	%{--</div>--}%
    </body>
</html>
