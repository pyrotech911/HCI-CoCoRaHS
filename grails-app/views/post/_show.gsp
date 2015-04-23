<%@ page import="cocorahs.Post" %>

<asset:stylesheet src="application.css"/>
<asset:stylesheet src="mystyle.css"/>
<asset:javascript src="getTime.js"/>
<script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
<script>window.onload = function() {
    getTime()
}</script>

<div class="subButton">
    <g:submitButton name="Submit" autofocus="true"  value="Ok" style="background-color: #838384;border: 1px; height:40px; width:250px; border-radius: 4% " ></g:submitButton>
</div>
