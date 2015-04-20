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
  <g:set var="navTitle" value="View/Create Posts" scope="request"/>
  <div class="map" id="map" style="width:100%;height:400px;"></div>
    <div class="addedit">
      <table style="border: none; outline: none">
      	<tr style="border-bottom: 1px solid #ffffff">
      	    <td style="border: none; outline: none"><g:link controller="post" action="create" params="${params}" style="color: #ffffff; font-size: 100%; font-weight: bold ">Make a New Post</g:link></td>
      	</tr>
      </table>
    </div>
    <div class="postList">
      <table>
        <g:each in="${postList}">
          <tr style="border-bottom: 1px solid #ffffff">
              <td style="outline: none; border: none">
                  <div class="postImg">
                  <g:link controller="post" action="show" style="color: #ffffff" id="${it.id}">${it.comment}</g:link>
                  </div>
              </td>
              <td style="border: none; outline: none">
                  <g:link controller="post" action="edit" id="${it.id}" style="color: #ffffff">Edit</g:link>
              </td>
          </tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
