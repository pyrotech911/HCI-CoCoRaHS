<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photo', 'error')} ">
     %{--<div class="photoLink">--}%
        %{--<table>--}%
            %{--<g:each in="${postInstance.photos}" var="p" status="i">--}%
                %{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
                    %{--<td>--}%
                        %{--<g:link controller="photo" action="show" id="${p.id}">--}%
                            %{--<img alt="Missing Photo" src="${createLink(controller:'photo', action:'showPhoto', id:"${p.id}")}" width="50" height="50">--}%
                        %{--</g:link>--}%
                    %{--</td>--}%
                %{--</tr>--}%
            %{--</g:each>--}%
        %{--</table>--}%
    %{--</div>--}%



    <div class="photoLink">
        <table border="0">
            <tr>
                <td style="border: none; outline: none">
                <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photo', 'error')} ">

                        <label for="photo">
                            <img alt="Missing Photo" src="${createLink(controller:'post', action:'showPhoto', id:"${postInstance?.id}")}" width=30% height="70px">
                            <img alt="Missing Photo" src="${createLink(controller:'post', action:'showPhoto_S', id:"${postInstance?.id}")}" width=30% height="70px">

                            <input style="display:inline" type="file" name="photo" accept="image/*" capture "/>
                            <input style="display:inline" type="file" name="photo_s" accept="image/*" capture "/>
                        </label>

                </div>
                </td>
            </tr>
        </table>
    </div>
</div>

<div class="textArea">
    <label for="comment">
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${postInstance.comment == null}">
        <g:textArea name="comment" placeholder="Location Notes" rows="5" cols="50" onfocus="true"></g:textArea>
    </g:if>
    <g:if test="${postInstance.comment != null}">
        <g:textArea name="comment" value="${postInstance?.comment}" rows="5" cols="40" onfocus="true"></g:textArea>
    </g:if>
</div>

<div class="subButton">
    <g:submitButton name="Submit" value="Post" style="background-color: #838384;border: 1px; height:40px; width:250px" ></g:submitButton>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
       <div class="select">
	        <g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one" />
       </div>
</div>




