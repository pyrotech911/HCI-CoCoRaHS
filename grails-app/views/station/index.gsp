<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Station</title>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script>window.onload = initGeolocation</script>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="mystyle.css"/>
  </head>
  <body>
  	<div class="map" id="map" style="width:500px;height:400px;">
    </div>
    <div class="list">
      <table>
        <g:each in="${stationList}">
          <tr><td><g:link controller="post" action="index" params='[stID: "${it.id}"]'>${it.stationId} (${it.longitude},${it.latitude})</g:link></td></tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
