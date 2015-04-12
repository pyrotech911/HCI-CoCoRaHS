<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Station</title>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
  <script>
  var latlngarray = [];
  </script>
    <script>window.onload = function() {
        initGeolocation()
    }</script>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="mystyle.css"/>
    <asset:javascript src="geolocation.js"/>
  </head>
  <body>
  	<div class="map" id="map" style="width:100%;height:400px;">
    </div>
    <div class="list">
      <table>
        <g:each in="${stationList}">
          <tr><td><g:link controller="post" action="index" params='[stID: "${it.id}"]'>${it.stationId} (${it.longitude},${it.latitude})</g:link></td></tr>
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
    </div>
  </body>
</html>
