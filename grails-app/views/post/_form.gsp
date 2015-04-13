<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photos', 'error')} ">
    %{--<g:each in="${postInstance.photos}" var="p">--}%
        %{--<g:link controller="photo" action="show" id="${p.id}">--}%
            %{--<img alt="Missing Photo" src="${createLink(controller:'post', action:'showPhoto', id:"${postInstance.id}")}">--}%
        %{--</g:link>--}%
    %{--</g:each>--}%

    <div class="photoLink">
        <table>
            <tr>
                <td> <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">photo 1  </g:link>
                <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">photo 2</g:link></td>
            </tr>

            <tr>
                <td> <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">photo 3  </g:link>
                <g:link controller="photo" action="create" params="['post.id': postInstance?.id]">photo 4</g:link></td>
            </tr>
        </table>
    </div>
</div>

<div class="textarea">
    <label for="comment">
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${postInstance.comment == null}">
        <g:textArea name="comment" placeholder="Location Notes" rows="5" cols="50"></g:textArea>
    </g:if>
    <g:if test="${postInstance.comment != null}">
        <g:textArea name="comment" value="${postInstance.comment}" rows="5" cols="40"></g:textArea>
    </g:if>
</div>

<div class="subButton">
    <g:submitButton name="Submit" value="Post" style="background-color: #838384;border: none; height:40px; width:250px"></g:submitButton>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
    <div class="postList">
	    <label for="station">
		    <span class="required-indicator">*</span>
	    </label>
	    <g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one"/>
    </div>
</div>



