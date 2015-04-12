<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
            <ul class="nav navbar-nav navbar-left">
				<li><button onclick="goBack()" class="back"><img src="/cocorahs/assets/site/BackButton.svg" height="50" width="80"></button></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="${createLink(uri: '#')}">
                    <img src="/cocorahs/assets/site/HelpButton.svg" height="50" width="80">
                </a></li>
            </ul>
		</div>
		<div id="create-post" class="content scaffold-create" role="main">
			%{--<h1><g:message code="default.create.label" args="[entityName]" /></h1>--}%
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${postInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${postInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form url="[resource:postInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
                %{--removing default create button - DJ --}%
				%{--<fieldset class="buttons">--}%
					%{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
				%{--</fieldset>--}%
			</g:form>


		</div>
	</body>
</html>
