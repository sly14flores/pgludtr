<?php

require_once 'authentication.php';

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Employees - PGLU DTR System</title>
<link rel="icon" href="favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/pages/dashboard.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">

	#logo {
		
		width: 50px;
		margin-right: 5px;
		
	}
	
	.profile-picture {
		
		width: 200px;
		margin-bottom: 5px;
		
	}
	
/* 	.login-footer {
		
		width: 100%;
		position: absolute;
		left: 0;
		bottom: 0;
		overflow: auto;
		margin: 0!important;
		
	} */
	
	.login-footer .footer-inner {
		
		background-color: rgba(0, 0, 0, 0.88);
		
	}	

</style>	
</head>
<body ng-app="employees" ng-controller="employeesCtrl">
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="index.php" style="margin: 0!important; padding: 0!important;"><img id="logo" src="img/logo.png">DTR System</a>
      <div class="nav-collapse">
	  
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-user"></i><b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="javascript:;">Settings</a></li>
              <li><a href="javascript:;" logout>Logout</a></li>
            </ul>
          </li>
        </ul>
		
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->

<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li><a href="index.php"><i class="icon-dashboard"></i><span>Dashboard</span> </a> </li>
        <li class="active"><a href="employees.php"><i class="icon-group"></i><span>Employees</span> </a> </li>
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->

<div class="main">
  <div class="main-inner">
    <div class="container">
      <div class="row">
		<div class="span4">
          <div class="widget widget-table action-table">
            <div class="widget-header"> <i class="icon-group"></i>
              <h3>Employees</h3><button class="btn btn-primary btn-xs pull-right" type="button" style="margin-top: 6px; margin-right: 10px;" ng-click="appService.add(this)" ng-disabled="controls.personalInfo.addBtn">Add</button>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
				
				<div class="controls" style="margin: 10px 0 10px 10px;">
					<strong>Search:&nbsp;</strong><input type="text" class="span3" ng-model="q">
				</div>
			
              <table class="table table-striped table-bordered">
                <thead>
                  <tr>
                    <th>EmpID</th>
                    <th>Name</th>
                  </tr>
                </thead>
                <tbody>
				
                  <tr dir-paginate="employee in employees | filter: q | itemsPerPage: pageSize" current-page="currentPage" style="cursor: pointer;">
                    <td> {{employee.empid}} </td>
                    <td> {{employee.full_name}} </td>
                  </tr>
                
                </tbody>
              </table>
			  <dir-pagination-controls template-url="angularjs/utils/pagination/dirPagination.tpl.html"></dir-pagination-controls>
            </div>
            <!-- /widget-content --> 
          </div>		
		</div>
		<div class="span8">
          <div class="widget">
            <div class="widget-header"> <i class="icon-user"></i>
              <h3></h3>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
              <div class="widget big-stats-container">
                <div class="widget-content">
				
						<div><img src="{{views.profilePicture}}" class="img-responsive img-thumbnail profile-picture" alt="Profile Picture"></div>				
						<input type="file" name="proPic" id="proPic" file-model="views.proPic" ng-disabled="controls.personalInfo.picture">						
						<div class="progress progress-striped" ng-show="views.showProPicUploadProgress">
							<div class="bar" style="width: {{views.progress}}%;"></div>
						</div>
						<div class="control-group">
						<button class="btn btn-primary" ng-disabled="controls.personalInfo.uploadBtn" ng-click="uploadProfilePicture()">Upload</button>
						</div>

						<hr>

						<div class="pull-right"><a href="javascript:;" class="btn btn-small btn-success" ng-disabled="controls.personalInfo.editBtn"><i class="btn-icon-only icon-edit"> </i></a>&nbsp;&nbsp;<a href="javascript:;" class="btn btn-danger btn-small" ng-disabled="controls.personalInfo.delBtn"><i class="btn-icon-only icon-remove"> </i></a></div>						
						<div class="tabbable" style="margin-top: 50px;">
						<ul class="nav nav-tabs">
						  <li class="active">
						    <a href="#personal-info" data-toggle="tab">Personal Info</a>
						  </li>
						  <li><a href="#dtr" data-toggle="tab">Daily Time Record</a></li>
						</ul>

						<br>
						
						<div class="tab-content">
							<div class="tab-pane active" id="personal-info">
								
								<form name="frmHolder.personalInfo" autocomplete="off">
									<fieldset>
										<div class="row">
											<div class="span2">
												<div class="control-group">
													<label><strong>Employee ID</strong></label>
													<div class="controls">
														<input type="text" class="span2" ng-model="personalInfo.empid" ng-disabled="controls.personalInfo.empid">
													</div>
												</div>
											</div>
											<div class="span4"></div>
										</div>
										<div class="row">
											<div class="span2">
												<div class="control-group">
													<label><strong>First Name</strong></label>
													<div class="controls">
														<input type="text" class="span2" ng-disabled="controls.personalInfo.first_name">
													</div>
												</div>
											</div>
											<div class="span2">
												<div class="control-group">
													<label><strong>Middle Name</strong></label>
													<div class="controls">
														<input type="text" class="span2" ng-disabled="controls.personalInfo.middle_name">
													</div>
												</div>
											</div>
											<div class="span2">
												<div class="control-group">
													<label><strong>Last Name</strong></label>
													<div class="controls">
														<input type="text" class="span2" ng-disabled="controls.personalInfo.last_name">
													</div>
												</div>
											</div>								
										</div>
										<div class="row" style="margin-bottom: 10px;">
											<div class="span2">
												<div class="control-group">											
													<label class="control-label"><strong>Gender</strong></label>                                            
													<div class="controls">
													<label class="radio inline">
													  <input type="radio" name="radiobtns" ng-disabled="controls.personalInfo.gender"> Male
													</label>
													
													<label class="radio inline">
													  <input type="radio" name="radiobtns" ng-disabled="controls.personalInfo.gender"> Female
													</label>
													</div>	<!-- /controls -->			
												</div>
											</div>
											<div class="span2">
												<div class="control-group">
													<label><strong>Birthday</strong></label>
													<div class="controls">
														<input type="date" class="span2" ng-disabled="controls.personalInfo.birthday">
													</div>
												</div>											
											</div>
											<div class="span2">
												<div class="control-group">
													<label><strong>Birthplace</strong></label>
													<div class="controls">
														<input type="text" class="span2" ng-disabled="controls.personalInfo.birthplace">
													</div>
												</div>											
											</div>											
										</div>
										<div class="row">
											<div class="span6">
												<div class="control-group">
													<label><strong>Address</strong></label>
													<div class="controls">
														<input type="text" class="span6" ng-disabled="controls.personalInfo.address">
													</div>
												</div>											
											</div>
										</div>
										<div class="row">
											<div class="span3">
												<div class="control-group">
													<label><strong>Contact No</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.contact_no">
													</div>
												</div>
											</div>
											<div class="span3">
												<div class="control-group">
													<label><strong>Email</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.email">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="span3">
												<div class="control-group">
													<label><strong>Appointment Status</strong></label>
													<div class="controls">
														<select class="span3" ng-model="personalInfo.appointment_status" ng-options="x for (x,y) in views.appointmentStatus track by y" ng-disabled="controls.personalInfo.appointment_status">
															<option value="">-</option>
														</select>
													</div>
												</div>
											</div>
											<div class="span3">
												<div class="control-group">
													<label><strong>Position</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.position">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="span3">
												<div class="control-group">
													<label><strong>GSIS</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.gsis">
													</div>
												</div>
											</div>
											<div class="span3">
												<div class="control-group">
													<label><strong>SSS</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.sss">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="span3">
												<div class="control-group">
													<label><strong>HDMF (Pagibig)</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.hdmf">
													</div>
												</div>
											</div>
											<div class="span3">
												<div class="control-group">
													<label><strong>Philhealth</strong></label>
													<div class="controls">
														<input type="text" class="span3" ng-disabled="controls.personalInfo.philhealth">
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="span6">
												<div class="form-actions">
													<button type="button" class="btn btn-primary" ng-disabled="controls.personalInfo.saveBtn">Save</button> 
													<button class="btn" ng-disabled="controls.personalInfo.cancelBtn" ng-click="appService.cancel(this)">Cancel</button>
												</div>
											</div>
										</div>
									</fieldset>
								</form>
								
							</div>
							<div class="tab-pane" id="dtr">
							
							</div>
						</div>
							
						</div>
                </div>
                <!-- /widget-content -->                 
              </div>
            </div>
          </div>		
		</div>		
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /main-inner --> 
</div>
<!-- /main -->

<div class="footer login-footer">
  <div class="footer-inner">
    <div class="container">
      <div class="row">
        <div class="span12"> &copy; 2016 PGLU-MISD </div>
        <!-- /span12 --> 
      </div>
      <!-- /row --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /footer-inner --> 
</div>
<!-- /footer --> 

<div id="confirm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="label-confirm">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="label-confirm">Modal title</h4>
	  </div>
	  <div class="modal-body">
		<p>One fine body&hellip;</p>
	  </div>
	  <div class="modal-footer">
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="notify" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="label-notify">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="label-notify">Modal title</h4>
	  </div>
	  <div class="modal-body">
		<p>One fine body&hellip;</p>
	  </div>
	  <div class="modal-footer">
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="modal-show" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="label-modal-show">
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="label-modal-show">Modal title</h4>
	  </div>
	  <div class="modal-body">
		<p>One fine body&hellip;</p>
	  </div>
	  <div class="modal-footer">
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="angularjs/angular.min.js"></script>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.blockUI.js"></script>
<script src="js/bootstrap-notify-3.1.3/bootstrap-notify.min.js"></script>

<script src="angularjs/utils/pagination/dirPagination.js"></script>

<script src="modules/bootstrap-modal.js"></script>
<script src="modules/block-ui.js"></script>
<script src="modules/bootstrap-notify.js"></script>
<script src="modules/account.js"></script>

<script src="controllers/employees.js"></script>

</body>
</html>
