<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>
<asset:javascript src="getTime.js"/>
<script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script>window.onload = function() {
	initGeolocation()
	getTime()
	}</script>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photo', 'error')} ">
     <div class="photoLink">
        <table>
            <g:each in="${postInstance.photos}" var="p" status="i">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>
                        <g:link controller="photo" action="show" id="${p.id}">
                            <img alt="Missing Photo" src="${createLink(controller:'photo', action:'showPhoto', id:"${p.id}")}" width="50" height="50">
                        </g:link>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>  


    <div class="photoLink">
        <table border="0">
            <tr>
                <td style="border: none; outline: none">
                <div class="fieldcontain ${hasErrors(bean: postInstance, field: 'photo', 'error')} ">
                        <label for="photo">
                            <img src="${createLink(controller:'post', action:'showPhoto', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20% "/>
                            <img src="${createLink(controller:'post', action:'showPhoto_S', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%"/>
                        </label>
                </div>
                </td>
            </tr>
        </table>
    </div>
</div>


<table style="border: none; outline: none">
    <tr ><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Location:  </td></tr>
    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff">${postInstance?.station?.latitude}   ${postInstance?.station?.longitude}</td></tr>
    <tr><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Time:</td></tr>
    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5% ; border-bottom: solid #ffffff"><p id="time"></p></td></tr>
</table>

<div class="fileinputs">
    <input type="file" name="photo" class="file"  style="width: 100px; height: 100px; display: inline; padding-top: 5%"  accept="image/*" capture "/>
    <div class="fakefile">
        <img src="${createLink(controller:'post', action:'showPhoto', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
    </div>
</div>

<div class="fileinputs">
    <input type="file" name="photo_s" class="file"  style="width: 100px; height: 100px; display: inline; padding-top: 5%; padding-left: calc(50%-250px)"  accept="image/*" capture "/>
    <div class="fakefile">
        <img src="${createLink(controller:'post', action:'showPhoto_S', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%; padding-top: 5%; padding-left: calc(50%-250px)"/>
    </div>
</div>


<div class="textArea">
    <label for="comment">
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${postInstance.comment == null}">
        <g:textArea name="comment" placeholder="Location Notes" rows="5" cols="50" onfocus="true" style="border-radius: 4%"></g:textArea>
    </g:if>
    <g:if test="${postInstance.comment != null}">
        <g:textArea name="comment" value="${postInstance?.comment}" rows="5" cols="40" onfocus="true" style="border-radius: 4%"></g:textArea>
    </g:if>
</div>

<div class="subButton">
    <g:submitButton name="Submit" value="Post" style="background-color: #838384;border: 1px; height:40px; width:250px; border-radius: 4% " ></g:submitButton>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
       <div class="select">
	        <g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one" />
       </div>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'timeStamp', 'error')} required">
    <g:field name="timeStamp" type="hidden" value="${new Date()}"></g:field>
</div>
