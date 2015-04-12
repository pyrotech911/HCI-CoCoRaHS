<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Post</title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="mystyle.css"/>
  </head>
  <body>
  <div class="container-fluid">
      <div class="list">
        <g:link class="create" action="create" params="${postInstance?.station?.id}" >
                <img src="/cocorahs/assets/site/AddSegment.svg" height="300" width="800">
        </g:link>
      </div>
   </div>
    <div class="list">
      <table>
        <g:each in="${postList}">
          <tr><td>${it.postId}(${it.comment})</td></tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
