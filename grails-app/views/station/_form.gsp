<%@ page import="cocorahs.Station" %>



<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="station.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stationInstance?.posts?}" var="p">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="post" action="create" params="['station.id': stationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'stationId', 'error')} required">
	<label for="stationId">
		<g:message code="station.stationId.label" default="Station Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="stationId" required="" value="${stationInstance?.stationId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: stationInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="station.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${cocorahs.CocoUser.list()}" optionKey="id" required="" value="${stationInstance?.user?.id}" class="many-to-one"/>

</div>

