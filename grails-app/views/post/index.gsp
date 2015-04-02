<!DOCTYPE html>
<html>
  <head>
    <meta name='layout' content='site'/>
    <title>Post</title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="mystyle.css"/>
  </head>
  <body>
    <div class="list">
      <table>
        <g:each in="${postList}">
          <tr><td>${it.postId} (${it.comment})</td></tr>
        </g:each>
      </table>
    </div>
  </body>
</html>
