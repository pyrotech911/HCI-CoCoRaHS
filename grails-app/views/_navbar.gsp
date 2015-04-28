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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><button onclick="goBack()" class="back"><img src="/cocorahs/assets/site/BackButton.svg" height=110% width=auto></button></li>
                    <li style="border: none; outline: none; width: auto;"><a href="${createLink(controller:'help')}"><img src="/cocorahs/assets/site/HelpButton.svg" style="height: 40px; padding-bottom: 0px"></a></li>
                    <li style="border: none; outline: none; width: auto"><form name="logout" method="POST" action="${createLink(controller:'logout') }"> <input type="submit" value="Logout" height="100%" class="logout"></form></li>

                </ul>
            </div>
       </div>

       <p class="navbar-text" style="padding-left: 40%; color: #ffffff;font-size: 170%">${navTitle}</p>
       <!-- Collect the nav links, forms, and other content for toggling -->
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                  <table>
                    <tr>
                    </tr>
                  </table>
            </ul>
       </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

%{--<li><form name="help" method="POST" action="${createLink(controller:'help')}"><input type="submit" value="Help" height="100%" class="settings"></form></li>--}%