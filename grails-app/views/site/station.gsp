<!DOCTYPE html>
<html>
  <head>
    <title>Map Test</title>
    <style>
      body,html {height:100%}
      #map {width:400px;height:400px;}
    </style>
    <asset:javascript src="geolocation.js"/>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
  </head>
  <body onload="javascript:initGeolocation()">
    <div id="map">
    </div>
  </body>
</html>
