function initGeolocation(){if(navigator&&navigator.geolocation){navigator.geolocation.getCurrentPosition(successCallback,errorCallback)}else{console.log("Geolocation is not supported")}}function errorCallback(){}function successCallback(e){var t=new google.maps.LatLng(e.coords.latitude,e.coords.longitude);var n={zoom:17,center:t,mapTypeId:google.maps.MapTypeId.ROADMAP};map_container=document.getElementById("map");map=new google.maps.Map(map_container,n);var r=window.location.href;var i=r.indexOf("station");if(i>-1){placeMarkersStation(map)}else{placeMarkersPost(map)}}function placeMarkersStation(e){var t;var n=[];for(t=0;t<latlngarray.length;t=t+4){console.log(latlngarray[t]);console.log(latlngarray[t+1]);console.log(latlngarray[t+2]);console.log(latlngarray[t+3]);var r=new google.maps.LatLng(latlngarray[t],latlngarray[t+1]);n[t/4]=new google.maps.Marker({position:r,map:e,title:latlngarray[t+2],url:latlngarray[t+3]});google.maps.event.addListener(n[t/4],"click",function(){window.location.href=this.url})}}function placeMarkersPost(e){var t=new google.maps.LatLng(latlngarray[index],latlngarray[index+1]);marker[index/3]=new google.maps.Marker({position:t,map:e,title:latlngarray[index+2]})}var map