<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Station</title>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script>var latlngarray = [];</script>
    <script>window.onload = function(){
        initGeolocation()
        calcWidth()
    }</script>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="mystyle.css"/>
    <asset:javascript src="geolocation.js"/>
  </head>
  <body>
    <g:set var="navTitle" value="Select Station" scope="request"/>
  	<div class="map" id="map" style="width:100%;height:400px;"></div>
      <table class="stationList">
        <g:each in="${stationList}">
          <g:if test="${it.latitude} != null && ${it.longitude} != null">
            <tr><td style="border:0px"><g:link controller="post" action="index" params='[stID: "${it.id}"]'><div class="stationEntry">${it.stationId} (${it.latitude},${it.longitude})</div></g:link></td></tr>
          </g:if>
          <g:else>
            <tr><td style="border:0px"><g:link controller="post" action="index" params='[stID: "${it.id}"]'><div class="stationEntry">${it.stationId} (Location Unknown)</div></g:link></td></tr>
          </g:else>
          <script>
            latlngarray[latlngarray.length] = ${it.latitude}
            latlngarray[latlngarray.length] = ${it.longitude}
            latlngarray[latlngarray.length] = "${it.stationId}"
            var url = window.location.href
            url = url.substring(0, url.length - 13)
            url = url + "post/index?stID=${it.id}"
            latlngarray[latlngarray.length] = url
          </script>
        </g:each>
      </table>
  </body>
</html>
