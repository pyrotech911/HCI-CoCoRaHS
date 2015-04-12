/**
 * 
 */

var map;

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
  map = new google.maps.Map(map_container, map_options);
  
  var markertest = window.location.href;
  var test = markertest.indexOf("station");
  if (test > -1) {
	  placeMarkersStation(map);
  } else {
	  placeMarkersPost(map);
  }
  
}

function placeMarkersStation(map) {
    var index;
    var marker = [];
    
	for(index = 0; index < latlngarray.length; index = index + 4) {
		console.log(latlngarray[index]);
		console.log(latlngarray[index + 1]);
		console.log(latlngarray[index + 2]);
		console.log(latlngarray[index + 3]);
		var latlng = new google.maps.LatLng(latlngarray[index], latlngarray[index + 1]);
		marker[index / 4] = new google.maps.Marker({
			position: latlng, 
			map:map, 
			title:latlngarray[index + 2],
		    url:latlngarray[index + 3]});
		
		google.maps.event.addListener(marker[index / 4], 'click', function() {
		    window.location.href = this.url;
		});
	}
}

function placeMarkersPost(map) {
	var latlng = new google.maps.LatLng(latlngarray[index], latlngarray[index + 1]);
	marker[index / 3] = new google.maps.Marker({
		position: latlng,
	    map:map,
	    title:latlngarray[index + 2]});
}