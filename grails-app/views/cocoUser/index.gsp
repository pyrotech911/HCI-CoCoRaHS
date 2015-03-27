
<%@ page import="cocorahs.CocoUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cocoUser.label', default: 'CocoUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cocoUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cocoUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'cocoUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'cocoUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'cocoUser.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'cocoUser.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'cocoUser.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'cocoUser.passwordExpired.label', default: 'Password Expired')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cocoUserInstanceList}" status="i" var="cocoUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cocoUserInstance.id}">${fieldValue(bean: cocoUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: cocoUserInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${cocoUserInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${cocoUserInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${cocoUserInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${cocoUserInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cocoUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
