
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
    <g:set var="navTitle" value="Post Updated" scope="request"/>
		<g:render template="/navbar"/>
		<div id="show-post" class="content scaffold-show" role="main">
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<ol class="property-list post">
                <table style="border: none; outline: none">
                    <g:if test="${postInstance?.station}">
                        <tr ><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%">Station:   ${postInstance?.station?.encodeAsHTML()}</td></tr>
                    </g:if>
                    <tr><td style="color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff; padding-bottom: 3%; padding-top: 3%">Location:  ${postInstance?.station?.latitude}, ${postInstance?.station?.longitude}</td></tr>
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
