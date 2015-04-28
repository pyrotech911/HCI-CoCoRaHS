
<%@ page import="cocorahs.Post" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <asset:stylesheet src="mystyle.css"/>
	</head>
	<body>
		<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <g:set var="navTitle" value="Current Post" scope="request"/>
		<g:render template="/navbar"/>
		<div id="show-post" class="content scaffold-show" role="main">
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<ol class="property-list post">
                <table style="border: none; outline: none">
                    <g:if test="${postInstance?.station}">
                        <tr ><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%">Station:   ${postInstance?.station?.encodeAsHTML()}</td></tr>
                    </g:if>
                    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%; padding-top: 3%">Location:  ${postInstance?.station?.latitude}, ${postInstance?.station?.longitude}</td></tr>
                </table>
                <table style="height: 350px">
                    <tr>
                        <td style="width: calc(50% - 100px); border: 0px">
                        </td>
                        <td style="width: 10px; border: 0px;">
                            <div class="fileinputs">
                                <p>Gauge View</p>
                                <div class="fakefile">
                                    <img id="uploadPreview1" src="${createLink(controller:'post', action:'showPhotoGauge', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                                </div>
                            </div>
                        </td>
                        <td style="width: 100px; border: 0px;">
                            <div class="fileinputs">
                                <p>Sky View</p>
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
                                <div class="fakefile">
                                    <img id="uploadPreview3" src="${createLink(controller:'post', action:'showPhotoNorth', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                                </div>
                            </div>
                        </td>
                        <td style="width: 100px; border: 0px;">
                            <div class="fileinputs">
                                <p>South View</p>
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
                                <div class="fakefile">
                                    <img id="uploadPreview5" src="${createLink(controller:'post', action:'showPhotoEast', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%;padding-top: 5%"/>
                                </div>
                            </div>
                        </td>
                        <td style="width: 100px; border: 0px;">
                            <div class="fileinputs">
                                <p>West View</p>
                                <div class="fakefile">
                                    <img id="uploadPreview6" src="${createLink(controller:'post', action:'showPhotoWest', id:"${postInstance?.id}")}" alt="Image not found" onError="this.onerror=null;this.src='/cocorahs/assets/site/photoAdd.svg';" width=100px height=100px style="border-radius: 20%; padding-top: 5%;"/>
                                </div>
                            </div>
                        </td>
                        <td style="width: calc(50% - 100px); border: 0px">
                        </td>
                    </tr>
                </table>
                <table style="border: none; outline: none">
                    <tr ><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%"></td></tr>
                    <g:if test="${postInstance?.comment}">
                        <tr ><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Comment:  </td></tr>
                        <tr><td style="color: #ffffff; font-size: 25px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%">${postInstance?.comment}</td></tr>
                    </g:if>
                    <tr><td style="color: #ffffff; font-size: 20px; border: none; outline: none; text-align: left; padding-left: 5%">Last Update: <p id="time"></p></td></tr>
                </table>
			</ol>
        </div>

    <g:form url="[resource:postInstance, action:'retSta']" enctype="multipart/form-data">
        <fieldset class="form">
            <g:render template="show"/>
        </fieldset>
    </g:form>

   	</body>
</html>
