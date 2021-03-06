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
	  placeMarkersPost(map, myLatlng);
  }
  
}

function placeMarkersStation(map) {
    var index;
    var marker = [];
	map.setCenter(new google.maps.LatLng(latlngarray[0], latlngarray[1]));
	map.setZoom(13);
    
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

function placeMarkersPost(map, myLatlng) {
	var newmarkertest = window.location.href;
	var test = newmarkertest.indexOf("create");
	if (test > -1) {
		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: "New Station Location"
		});
		map.setCenter(myLatlng);

		var element = document.getElementById("locTitle");
		element.innerHTML = "New Station Location:";
		var element = document.getElementById("locData");
		element.innerHTML = myLatlng.lat().toString().concat(" ",myLatlng.lng().toString());

		var element = document.getElementById("googleLat");
		element.value = myLatlng.lat().toString();
		var element = document.getElementById("googleLng");
		element.value = myLatlng.lng().toString();
	}
	else {
		var latlng = new google.maps.LatLng(latlngarray[0], latlngarray[1]);
		var marker = new google.maps.Marker({
			position: latlng,
			map: map,
			title: latlngarray[2]
		});
		map.setCenter(latlng);
	}
	map.setZoom(16);
}