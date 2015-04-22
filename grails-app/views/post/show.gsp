
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
		<g:render template="/navbar"/>
		<div id="show-post" class="content scaffold-show" role="main">
        <g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<ol class="property-list post">


                <table style="border: none; outline: none">
                    <g:if test="${postInstance?.station}">
                        <tr ><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Location:  </td></tr>
                        <tr><td style="color: #ffffff; font-size: 25px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff">${postInstance?.station?.encodeAsHTML()}</td></tr>
                    </g:if>
                    <tr ><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Location:  </td></tr>
                    <tr><td style="color: #ffffff; font-size: 25px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff">${postInstance?.station?.latitude}   ${postInstance?.station?.longitude}</td></tr>
                    <tr><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Time:</td></tr>
                    <tr><td style="color: #ffffff; font-size: 25px; border: none; outline: none; text-align: left; padding-left: 5% ; border-bottom: solid #ffffff"><p id="time"></p></td></tr>
                    <g:if test="${postInstance?.comment}">
                        <tr ><td style="font-style: italic; color: #ffffff; font-size: 30px; border: none; outline: none; text-align: left; padding-left: 5%">Comment:  </td></tr>
                        <tr><td style="color: #ffffff; font-size: 25px; border: none; outline: none; text-align: left; padding-left: 5%; border-bottom: solid #ffffff">${postInstance?.comment}</td></tr>
                    </g:if>
                </table>
			</ol>
        </div>
	</body>
</html>
