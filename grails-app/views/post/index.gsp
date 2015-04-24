<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Post</title>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script>window.onload = initGeolocation</script>
    <script>
        var latlngarray = [];
        latlngarray[0] = ${latlng[0].lat};
        latlngarray[1] = ${latlng[0].lon};
        latlngarray[2] = "${latlng[0].name}";
        console.log(latlngarray[2]);
    </script>
    <asset:stylesheet src="mystyle.css"/>
  </head>
  <body>
  <g:set var="navTitle" value="View/Create Posts" scope="request"/>
  <div class="map" id="map" style="width:100%;height:400px;"></div>
    <table class="addPost">
      <tr style="border-bottom: 1px solid #ffffff">
        <td class="addButton"><g:link controller="post" action="create" params="${params}" style="color: #ffffff; font-size: 100%; font-weight: bold ">Make a New Post</g:link></td>
      </tr>
    </table>
    <hr />
    <table class="postList">
      <g:each in="${postList}">
        <tr style="border-bottom: 1px solid #ffffff">
          <td class="postEntry">
            <div class="postImg">
              <g:link controller="post" action="show" style="color: #ffffff; align-items: center" id="${it.id}">${it.comment}</g:link>
            </div>
          </td>
          <td class="postEdit">
            <g:link controller="post" action="edit" id="${it.id}" style="color: #ffffff">Edit</g:link>
            <a href="${createLink(controller:'post', action: 'edit',id:"${it.id}" )}"><img src="/cocorahs/assets/site/Edit.svg" style="height: 40px; padding-top: 0px"></a>
          </td>
        </tr>
      </g:each>
    </table>
  </body>
</html>
