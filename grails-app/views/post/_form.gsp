<%@ page import="cocorahs.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="post.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comment" required="" value="${postInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="post.photos.label" default="Photos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.photos?}" var="p">
    <li><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="photo" action="create" params="['post.id': postInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
	<label for="station">
		<g:message code="post.station.label" default="Station" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one"/>

</div>

