<head>
	<asset:javascript src="goback.js"/>
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
            <button onclick="goBack()" class="back">Return</button>
       </div>
 
       <!-- Collect the nav links, forms, and other content for toggling -->
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                  <li><form name="settings" method="POST" action=""> <input type="submit" value="Settings" height="100px" class="settings"></form></li>
                  <li><form name="logout" method="POST" action="${createLink(controller:'logout') }"> <input type="submit" value="Logout" height="50px" class="logout"></form></li>


            </ul>
       </div><!-- /.navbar-collapse -->


    </div><!-- /.container-fluid -->
</nav>