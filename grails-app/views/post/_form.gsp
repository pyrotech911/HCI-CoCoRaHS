<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>
<asset:javascript src="getTime.js"/>
<asset:javascript src="imageUpload.js"/>
<script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script>
    window.onload = function() {
        initGeolocation()
        getTime()
    }
</script>

<table style="border: none; outline: none">
    <tr><td id="locTitle" style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Location:  </td></tr>
    <tr><td id="locData" style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff">${postInstance?.station?.latitude}   ${postInstance?.station?.longitude}</td></tr>
    <tr><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Time:</td></tr>
    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5% ; border-bottom: solid #ffffff"><p id="time"></p></td></tr>
</table>

<table>
    <tr>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>Gauge View</p>
                <input id="uploadImage1" onchange="PreviewImage('1');" type="file" name="photo_gauge" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview1" src="${createLink(controller:'post', action:'showPhotoGauge', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                </div>
            </div>
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>Sky View</p>
                <input id="uploadImage2" onchange="PreviewImage('2');" type="file" name="photo_sky" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview2" src="${createLink(controller:'post', action:'showPhotoSky', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%; padding-top: 5%;"/>
                </div>
            </div>
        </td>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
    </tr>
    <tr>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>North View</p>
                <input id="uploadImage3" onchange="PreviewImage('3');" type="file" name="photo_north" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview3" src="${createLink(controller:'post', action:'showPhotoNorth', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                </div>
            </div>
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>South View</p>
                <input id="uploadImage4" onchange="PreviewImage('4');" type="file" name="photo_south" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview4" src="${createLink(controller:'post', action:'showPhotoSouth', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%; padding-top: 5%;"/>
                </div>
            </div>
        </td>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
    </tr>
    <tr>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>East View</p>
                <input id="uploadImage5" onchange="PreviewImage('5');" type="file" name="photo_east" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview5" src="${createLink(controller:'post', action:'showPhotoEast', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                </div>
            </div>
        </td>
        <td style="width: 100px; border: 0px;">
            <div class="fileinputs">
                <p>West View</p>
                <input id="uploadImage6" onchange="PreviewImage('6');" type="file" name="photo_west" class="file"  style="width: 100px; height: 100px; padding-top: 5%"  accept="image/*" capture/>
                <div class="fakefile">
                    <img id="uploadPreview6" src="${createLink(controller:'post', action:'showPhotoWest', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%; padding-top: 5%;"/>
                </div>
            </div>
        </td>
        <td style="width: calc(50% - 100px); border: 0px">
        </td>
    </tr>
    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%"></td></tr>
</table>

<table>
    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5% ; border-bottom: solid #ffffff"></td></tr>
</table>

<div class="textArea">
    <label for="comment">
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${postInstance.comment == null}">
        <g:textArea name="comment" autofocus="true" placeholder="Location Notes" rows="5" cols="50" onfocus="true" style="border-radius: 4%"></g:textArea>
    </g:if>
    <g:if test="${postInstance.comment != null}">
        <g:textArea name="comment" autofocus="true" value="${postInstance?.comment}" rows="5" cols="40" onfocus="true" style="border-radius: 4%"></g:textArea>
    </g:if>
</div>

<div class="subButton">
    <g:submitButton class="confirmation" name="Submit" value="Post" style="background-color: #838384;border: 1px; height:40px; width:250px; border-radius: 4%" onclick="return confirm('Update your station location or post?')"></g:submitButton>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'station', 'error')} required">
       <div class="select">
	        <g:select id="station" name="station.id" from="${cocorahs.Station.list()}" optionKey="id" required="" value="${postInstance?.station?.id}" class="many-to-one" />
       </div>
</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'timeStamp', 'error')} required">
    <g:field name="timeStamp" type="hidden" value="${new Date();}"></g:field>
</div>

<g:field name="newLat" id="googleLat" type="hidden" value="${postInstance?.station?.latitude}"></g:field>
<g:field name="newLng" id="googleLng" type="hidden" value="${postInstance?.station?.longitude}"></g:field>
