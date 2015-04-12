<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photos', 'error')} ">

<label for="photos">
	<g:message code="post.photos.label" default="Photos" />
</label>
	
<ul class="one-to-many">
<g:each in="${postInstance?.photos?}" var="p">
    <li><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>

<li class="add">
    <div class="subButton">
        <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">
            photo 1
        ${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}
        </g:link>

        <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">
            photo 2
        ${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}
        </g:link>
    </div>

    <div class="subButton">
        <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">
            photo 3
        ${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}
        </g:link>

        <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">
            photo 4
        ${message(code: 'default.add.label', args: [message(code: 'photo.label', default: 'Photo')])}
        </g:link>
    </div>

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

    <div class="textarea">
        <label for="comment">
         <span class="required-indicator">*</span>
        </label>
        <g:if test="${postInstance.comment == null}">
            <g:textArea name="comment" placeholder="Location Notes" rows="5" cols="40"></g:textArea>
        </g:if>
        <g:if test="${postInstance.comment != null}">
            <g:textArea name="comment" value="${postInstance.comment}" rows="5" cols="40"></g:textArea>
        </g:if>

    </div>

    <div class="subButton">
        <g:submitButton name="Submit" value="Post" style="background-color: #838384;border: none; height:40px; width:250px"></g:submitButton>
    </div>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
	<label for="station">
		<g:message code="post.station.label" default="Station" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one"/>
</div>



