<head>
	<asset:javascript src="goback.js"/>
	<asset:stylesheet src="mystyle.css"/>
</head>
<nav class="navbar navbar-default navbar-static-top" role="navigation">
   <div class="container-fluid">
 
       <!-- Brand and toggle get grouped for better mobile display -->
       <div class="navbar-header">
            <!-- This makes the button for collapsed navbar -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <button onclick="goBack()" class="back"><img src="/cocorahs/assets/site/BackButton.svg" height="50" width="80"></button>
       </div>
 
       <!-- Collect the nav links, forms, and other content for toggling -->
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                  <li><form name="help" method="POST" action="${createLink(controller:'help') }"> <input type="submit" value="Help" height="100px" class="settings"></form></li>
                  <li><form name="logout" method="POST" action="${createLink(controller:'logout') }"> <input type="submit" value="Logout" height="50px" class="logout"></form></li>


            </ul>
       </div><!-- /.navbar-collapse -->


    </div><!-- /.container-fluid -->
</nav>