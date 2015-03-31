/**
 * 
 */
function initGeolocation() {
  if (navigator && navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
  } else {
    console.log('Geolocation is not supported');
  }
}
     
function errorCallback() {}

function successCallback(position) {
  var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  var map_options = {
    zoom: 17,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map_container = document.getElementById('map');
  var map = new google.maps.Map(map_container, map_options);
}