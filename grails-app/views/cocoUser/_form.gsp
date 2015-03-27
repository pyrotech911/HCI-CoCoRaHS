<%@ page import="cocorahs.CocoUser" %>



<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="cocoUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${cocoUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="cocoUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${cocoUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="cocoUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${cocoUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="cocoUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${cocoUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="cocoUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${cocoUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: cocoUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="cocoUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${cocoUserInstance?.passwordExpired}" />

</div>

