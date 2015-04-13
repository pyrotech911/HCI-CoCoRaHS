<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Post</title>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script>window.onload = initGeolocation</script>
    <asset:stylesheet src="mystyle.css"/>
  </head>
  <body>
  <div class="map" id="map" style="width:100%;height:400px;">
    </div>
    <div class="addedit">
      <table>
      	<tr>
      	  <td>Create a new Post</td>
      	  <td><g:link controller="post" action="create">+</g:link></td>
      	</tr>
      </table>
    </div>
    <div class="postList">
      <table>
        <g:each in="${postList}">
          <tr>
              <td><g:link controller="post" action="show" id="${it.id}">${it.id} (${it.comment})</g:link></td>
              <td><g:link controller="post" action="edit" id="${it.id}">Edit</g:link></td>
          </tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
