<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <!-- <title><?php echo $page_title; ?></title> -->
        <title><?php echo SITE_NAME; ?> CrewCenter</title>
        
        <?php echo $page_htmlhead; ?>
        
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/css/skins/_all-skins.min.css">
        <!-- iCheck -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/iCheck/flat/blue.css">
        <!-- Morris chart -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/morris/morris.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <!-- Date Picker -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/datepicker/datepicker3.css">
        <!-- Daterange picker -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <?php echo $page_htmlreq; ?>
        
        <div id="content">

<?php
    
    if(empty(Auth::$userinfo->firstname)) {
        header("Location: /");
    }
    
?>
   
<div class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
            <!-- Logo -->
            <a href="<?php echo SITE_URL?>" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini">C<b>C</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg">Crew<b>Center</b></span>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/img/pilot.png" class="user-image" alt="User Image">
                                <span class="hidden-xs"><?php echo Auth::$userinfo->firstname.' '.Auth::$userinfo->lastname; ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/img/pilot.png" class="img-circle" alt="User Image">

                                    <p>
                                        <?php echo Auth::$userinfo->firstname.' '.Auth::$userinfo->lastname; ?>
                                        <small><?php echo $pilotcode; ?></small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="<?php echo url('/profile/editprofile'); ?>" class="btn btn-primary btn-block btn-flat">My Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<?php echo url('/logout'); ?>" class="btn btn-danger btn-block btn-flat">Log Out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/img/pilot.png" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p><?php echo Auth::$userinfo->firstname.' '.Auth::$userinfo->lastname; ?></p>
                        <a><i class="fa fa-circle text-success"></i><?php if(PilotGroups::group_has_perm(Auth::$usergroups, ACCESS_ADMIN)) { echo ' Administrator'; } else { echo ' Pilot'; } ?></a>
                    </div>
                </div>
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">NAVIGATION</li>
                    <li>
                        <a href="<?php echo SITE_URL?>">
                            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo url('/schedules/view'); ?>">
                            <i class="fa fa-search"></i> <span>Schedule Search</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo url('/pireps/filepirep'); ?>">
                            <i class="fa fa-file-text"></i> <span>File Manual Report</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo url('/pireps/mine'); ?>">
                            <i class="fa fa-list"></i> <span>My Reports</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo url('/schedules/bids'); ?>">
                            <i class="fa fa-list"></i> <span>My Bids</span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo url('/downloads'); ?>">
                            <i class="fa fa-cloud-download"></i> <span>Downloads</span>
                        </a>
                    </li>
                    
                    <?php if(PilotGroups::group_has_perm(Auth::$usergroups, ACCESS_ADMIN)) { echo '
                    <li>
                        <a href=" '.SITE_URL.'/admin">
                            <i class="fa fa-cog"></i> <span>Administration</span>
                        </a>
                    </li>
                    '; } ?>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">

<section class="content-header">
    <h1>Schedule Search</h1>
</section>

<!-- Main content -->
<section class="content">
    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <section class="col-lg-3 connected">
            <div class="box box-primary">
                <div class="box-body">
                    <p>Click the button below to return to the search page.</p>
                    <a href="<?php echo url('/schedules/view'); ?>" class="btn btn-primary btn-flat">Return to Search</a>
                </div>
            </div>
        </section>
        <!-- /.Left col -->
        <!-- Middle col -->
        <section class="col-lg-9 connected">
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">Search Results</h3>
                </div>
                <!-- /.box-header -->
                <?php
                    if(!$allroutes) {
                ?>    
                <div class="box-body">
                    <div class="callout callout-info">
                        <h4>No Results</h4>
                        Your search returned no results.
                    </div>
                </div>
                <?php
                    } else {
                ?>
                <div class="box-body table-responsive no-padding">
                    <table id="tabledlist" class="tablesorter table table-hover">
                        <thead>
                            <tr>
                                <th>Flight Information</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                        foreach($allroutes as $route)
                        {

                            /* Uncomment this code if you want only schedules which are from the last PIREP that
                                pilot filed */
                            /*if(Auth::LoggedIn())
                            {
                                $search = array(
                                    'p.pilotid' => Auth::$userinfo->pilotid,
                                    'p.accepted' => PIREP_ACCEPTED
                                );

                                $reports = PIREPData::findPIREPS($search, 1); // return only one

                                if(is_object($reports))
                                {
                                    # IF the arrival airport doesn't match the departure airport
                                    if($reports->arricao != $route->depicao)
                                    {
                                        continue;
                                    }
                                }
                            }*/

                            /*
                            Skip over a route if it's not for this day of week
                            Left this here, so it can be omitted if your VA
                             doesn't use this. 

                            Comment out these two lines if you don't want to.
                            */

                            /*	Check if a 7 is being used for Sunday, since PHP
                                thinks 0 is Sunday */
                            $route->daysofweek = str_replace('7', '0', $route->daysofweek);

                            if(strpos($route->daysofweek, date('w')) === false)
                                continue;

                            /* END DAY OF WEEK CHECK */



                            /*
                            This will skip over a schedule if it's been bid on
                            This only runs if the below setting is enabled

                            If you don't want it to skip, then comment out
                            this code below by adding // in front of each 
                            line until the END DISABLE SCHEDULE comment below

                            If you do that, and want to show some text when
                            it's been bid on, see the comment below
                            */
                            if(Config::Get('DISABLE_SCHED_ON_BID') == true && $route->bidid != 0)
                            {
                                continue;
                            }
                            /* END DISABLE SCHEDULE ON BID */


                            /*	Skip any schedules which have aircraft that the pilot
                                is not rated to fly (according to RANK), only skip them if
                                they are logged in. */
                            if(Config::Get('RESTRICT_AIRCRAFT_RANKS') === true && Auth::LoggedIn())
                            {
                                /*	This means the aircraft rank level is higher than
                                    what the pilot's ranklevel, so just do "continue"
                                    and move onto the next route in the list 
                                 */
                                if($route->aircraftlevel > Auth::$userinfo->ranklevel)
                                {
                                    continue;
                                }
                            }

                            /* THIS BEGINS ONE TABLE ROW */
                        ?>
                                <tr>
                                    <td>
                                        <a href="<?php echo url('/schedules/details/'.$route->id);?>"><?php echo $route->code . $route->flightnum?>
                                    <?php echo '('.$route->depicao.' - '.$route->arricao.')'?>
                                </a>
                                        <br />

                                        <strong>Departure: </strong>
                                        <?php echo $route->deptime;?> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Arrival: </strong>
                                            <?php echo $route->arrtime;?>
                                                <br />
                                                <strong>Equipment: </strong>
                                                <?php echo $route->aircraft; ?> (
                                                    <?php echo $route->registration;?>) <strong>Distance: </strong>
                                                        <?php echo $route->distance . Config::Get('UNITS');?>
                                                            <br />
                                                            <strong>Days Flown: </strong>
                                                            <?php echo Util::GetDaysCompact($route->daysofweek); ?>
                                                                <br />
                                                                <?php echo ($route->route=='') ? '' : '<strong>Route: </strong>'.$route->route.'<br />' ?>
                                                                    <?php echo ($route->notes=='') ? '' : '<strong>Notes: </strong>'.html_entity_decode($route->notes).'<br />' ?>
                                                                        <?php
                                # Note: this will only show if the above code to
                                #	skip the schedule is commented out
                                if($route->bidid != 0)
                                {
                                    echo 'This route has been bid on';
                                }
                                ?>
                                    </td>
                                    <td nowrap>
                                        <a href="<?php echo url('/schedules/details/'.$route->id);?>">View Details</a>
                                        <br />
                                        <a href="<?php echo url('/schedules/brief/'.$route->id);?>">Pilot Brief</a>
                                        <br />

                                        <?php 
                                # Don't allow overlapping bids and a bid exists
                                if(Config::Get('DISABLE_SCHED_ON_BID') == true && $route->bidid != 0)
                                {
                                ?>
                                            <a id="<?php echo $route->id; ?>" class="addbid" href="<?php echo actionurl('/schedules/addbid');?>">Add to Bid</a>
                                            <?php
                                }
                                else
                                {
                                    if(Auth::LoggedIn())
                                    {
                                     ?>
                                                <a id="<?php echo $route->id; ?>" class="addbid" href="<?php echo url('/schedules/addbid');?>">Add to Bid</a>
                                                <?php			 
                                    }
                                }		
                                ?>
                                    </td>
                                </tr>
                                <?php
                         /* END OF ONE TABLE ROW */
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
                <?php } ?>
            </div>
            <!-- /.box -->
        </section>
        <!-- /.Second col -->
    </div>
    <!-- /.row (main row) -->

</section>
<!-- /.content -->

        </div>
        <!-- /.content-wrapper -->
        
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                CrewCenter by Mark Swan | Powered by phpVMS
            </div>
            <strong>Copyright &copy; <?php echo date('Y') ?> <?php echo SITE_NAME; ?></strong>
        </footer>
    </div>
    <!-- ./wrapper -->
</div>

</div>
        
        <!-- jQuery 2.2.3 -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- jQuery UI 1.11.4 -->
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
        <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
        <script>
            $.widget.bridge('uibutton', $.ui.button);
        </script>
        <!-- Bootstrap 3.3.6 -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/bootstrap/js/bootstrap.min.js"></script>
        <!-- Morris.js charts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/morris/morris.min.js"></script>
        <!-- Sparkline -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/knob/jquery.knob.js"></script>
        <!-- daterangepicker -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
        <!-- Slimscroll -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- FastClick -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/js/app.min.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/js/pages/dashboard.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="<?php echo SITE_URL?>/lib/skins/crewcenter/dist/js/demo.js"></script>
    </body>

<!-- <?php
if(!$allroutes)
{
	echo '<p align="center">No routes have been found!</p>';
	return;
}
?>
<table id="tabledlist" class="tablesorter">
<thead>
<tr>
	<th>Flight Info</th>
	<th>Options</th>
</tr>
</thead>
<tbody>
<?php
foreach($allroutes as $route)
{
	
	/* Uncomment this code if you want only schedules which are from the last PIREP that
		pilot filed */
	/*if(Auth::LoggedIn())
	{
		$search = array(
			'p.pilotid' => Auth::$userinfo->pilotid,
			'p.accepted' => PIREP_ACCEPTED
		);
		
		$reports = PIREPData::findPIREPS($search, 1); // return only one
		
		if(is_object($reports))
		{
			# IF the arrival airport doesn't match the departure airport
			if($reports->arricao != $route->depicao)
			{
				continue;
			}
		}
	}*/
	
	/*
	Skip over a route if it's not for this day of week
	Left this here, so it can be omitted if your VA
	 doesn't use this. 
	 
	Comment out these two lines if you don't want to.
	*/
	
	/*	Check if a 7 is being used for Sunday, since PHP
		thinks 0 is Sunday */
	$route->daysofweek = str_replace('7', '0', $route->daysofweek);
	
	if(strpos($route->daysofweek, date('w')) === false)
		continue;
		
	/* END DAY OF WEEK CHECK */
	
		
	
	/*
	This will skip over a schedule if it's been bid on
	This only runs if the below setting is enabled
	
	If you don't want it to skip, then comment out
	this code below by adding // in front of each 
	line until the END DISABLE SCHEDULE comment below
	
	If you do that, and want to show some text when
	it's been bid on, see the comment below
	*/
	if(Config::Get('DISABLE_SCHED_ON_BID') == true && $route->bidid != 0)
	{
		continue;
	}
	/* END DISABLE SCHEDULE ON BID */
	
	
	/*	Skip any schedules which have aircraft that the pilot
		is not rated to fly (according to RANK), only skip them if
		they are logged in. */
	if(Config::Get('RESTRICT_AIRCRAFT_RANKS') === true && Auth::LoggedIn())
	{
		/*	This means the aircraft rank level is higher than
			what the pilot's ranklevel, so just do "continue"
			and move onto the next route in the list 
		 */
		if($route->aircraftlevel > Auth::$userinfo->ranklevel)
		{
			continue;
		}
	}
	
	/* THIS BEGINS ONE TABLE ROW */
?>
<tr>
	<td>
		<a href="<?php echo url('/schedules/details/'.$route->id);?>"><?php echo $route->code . $route->flightnum?>
			<?php echo '('.$route->depicao.' - '.$route->arricao.')'?>
		</a>
		<br />
		
		<strong>Departure: </strong><?php echo $route->deptime;?> &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Arrival: </strong><?php echo $route->arrtime;?><br />
		<strong>Equipment: </strong><?php echo $route->aircraft; ?> (<?php echo $route->registration;?>)  <strong>Distance: </strong><?php echo $route->distance . Config::Get('UNITS');?>
		<br />
		<strong>Days Flown: </strong><?php echo Util::GetDaysCompact($route->daysofweek); ?><br />
		<?php echo ($route->route=='') ? '' : '<strong>Route: </strong>'.$route->route.'<br />' ?>
		<?php echo ($route->notes=='') ? '' : '<strong>Notes: </strong>'.html_entity_decode($route->notes).'<br />' ?>
		<?php
		# Note: this will only show if the above code to
		#	skip the schedule is commented out
		if($route->bidid != 0)
		{
			echo 'This route has been bid on';
		}
		?>
	</td>
	<td nowrap>
		<a href="<?php echo url('/schedules/details/'.$route->id);?>">View Details</a><br />
		<a href="<?php echo url('/schedules/brief/'.$route->id);?>">Pilot Brief</a><br />
		
		<?php 
		# Don't allow overlapping bids and a bid exists
		if(Config::Get('DISABLE_SCHED_ON_BID') == true && $route->bidid != 0)
		{
		?>
			<a id="<?php echo $route->id; ?>" class="addbid" 
				href="<?php echo actionurl('/schedules/addbid');?>">Add to Bid</a>
		<?php
		}
		else
		{
			if(Auth::LoggedIn())
			{
			 ?>
				<a id="<?php echo $route->id; ?>" class="addbid" 
					href="<?php echo url('/schedules/addbid');?>">Add to Bid</a>
			<?php			 
			}
		}		
		?>
	</td>
</tr>
<?php
 /* END OF ONE TABLE ROW */
}
?>
</tbody>
</table>
<hr> -->