var app = angular.module('employees', ['angularUtils.directives.dirPagination','ui.bootstrap','block-ui','bootstrap-modal','bootstrap-notify','account']);

app.directive('fileModel', ['$parse', function ($parse) {
	return {
	   restrict: 'A',
	   link: function(scope, element, attrs) {
		  var model = $parse(attrs.fileModel);
		  var modelSetter = model.assign;
		  
		  element.bind('change', function() {
			 scope.$apply(function(){
				modelSetter(scope, element[0].files[0]);
			 });
		  });

		  // scope.$watch(attrs.fileModel, function(file) {
			// $('#'+element['context']['id']).val(null);
		  // });
	   }
	};
}]);

app.service('fileUpload', ['$http', function ($http) {
	this.uploadFileToUrl = function(file, uploadUrl, scope) {
		
	   var fd = new FormData();
	   fd.append('file', file);

        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.open("POST", uploadUrl);
        scope.progressVisible = true;
        xhr.send(fd);
	   
		// upload progress
		function uploadProgress(evt) {
			scope.views.showProPicUploadProgress = true;
			scope.$apply(function(){
				scope.views.progress = 0;			
				if (evt.lengthComputable) {
					scope.views.progress = Math.round(evt.loaded * 100 / evt.total);
				} else {
					scope.views.progress = 'unable to compute';
					scope.views.profilePicture = "img/avatar.png";					
				}
			});
		}

		function uploadComplete(evt) {

			const pp = file['name'];
			const en = pp.substring(pp.indexOf("."),pp.length);

			/* This event is raised when the server send back a response */
			scope.$apply(function() {

				scope.views.profilePicture = null;
				scope.views.profilePicture = 'pictures/'+scope.personalInfo.empid+'/'+scope.personalInfo.empid+en+'?id='+Math.random();
				scope.views.showProPicUploadProgress = false;

			});

			$('#proPic').val(null);
		}

	}
}]);

app.factory('appService',function($http,$timeout,bootstrapNotify,bootstrapModal,blockUI) {
	
	function appService() {
		
		var self = this;
		
		self.controls = function(scope,opt) {
			
			scope.controls.personalInfo = {
				picture: opt,
				empid: opt,
				schedule_id: opt,
				first_name: opt,
				middle_name: opt,
				last_name: opt,
				gender: opt,
				birthday: opt,
				birthplace: opt,
				address: opt,
				contact_no: opt,
				email: opt,
				appointment_status: opt,
				position: opt,
				gsis: opt,
				sss: opt,
				hdmf: opt,
				philhealth: opt,
				uploadBtn: opt,
				saveBtn: opt,
				cancelBtn: opt,
				editBtn: opt,
				delBtn: opt
			};
			
		};
		
		self.onAdd = function(scope) {
			self.controls(scope,false);
			scope.controls.personalInfo.addBtn = true;
			scope.controls.personalInfo.editBtn = true;
			scope.controls.personalInfo.delBtn = true;
		};
		
		self.onCancel = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;			
		};
		
		self.onSave = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;
		};
		
		self.onView = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;
		};
		
		self.onEdit = function(scope) {
			self.controls(scope,false);
			scope.controls.personalInfo.addBtn = true;
			scope.controls.personalInfo.editBtn = true;
			scope.controls.personalInfo.delBtn = true;			
		};
		
		self.onClose = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;			
		};
		
		self.required = ['empid', 'first_name', 'middle_name', 'last_name', 'schedule_id'];
		
		self.start = function(scope) {

			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=start'
			}).then(function mySucces(response) {
			
				scope.employees = [...response.data];
				scope.employeesPrinting = [...response.data];
				
			}, function myError(response) {
				 
			  // error
				
			});
			
		};
		
		self.add = function(scope) {
			
			self.onAdd(scope);

			scope.personalInfo = {};
			scope.personalInfo.id = 0;
			scope.personalInfo.schedule_id = {id: 0, description: "Default"};
			scope.views.profilePicture = "img/avatar.png";
			
			scope.views.employee = "";
			scope.views.empid = "";
			scope.views.position = "";			
			
			scope.views.addUpdateTxt = 'Save';
			scope.views.cancelCloseTxt = 'Cancel';
			
			// insert new employee
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=new'
			}).then(function mySucces(response) {
			
				scope.personalInfo.id = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});			
			
		};
		
		self.cancel = function(scope) {
			
			if (scope.views.cancelCloseTxt == 'Cancel') {
			
				self.onCancel(scope);

				if ((scope.personalInfo.empid == '') || (scope.personalInfo.empid == undefined)) scope.personalInfo.empid = 0;
				
				$http({
				  method: 'POST',
				  url: 'controllers/employees.php?r=cancel',
				  data: {id: [scope.personalInfo.id], empid: scope.personalInfo.empid}
				}).then(function mySucces(response) {
				
					scope.personalInfo = {};
					scope.personalInfo.id = 0;
					scope.views.profilePicture = "img/avatar.png";			
					
					angular.forEach(self.required, function(item, i) {
						if ((scope.personalInfo[item] == '') || (scope.personalInfo[item] == undefined)) {
							scope.frmHolder.personalInfo[item].$invalid = true;
							scope.frmHolder.personalInfo[item].$touched = false;
						}
					});					
					
				}, function myError(response) {
					 
				  // error
					
				});

			} else {
				
				self.onClose(scope);
				
			}
		
		};
		
		self.update = function(scope) {

			if (scope.frmHolder.personalInfo.$invalid) {
				angular.forEach(self.required, function(item, i) {
					scope.frmHolder.personalInfo[item].$touched = true;
				});
				bootstrapNotify.show('danger','Please fill up the required field(s)');
				return;
			}
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=update',
			  data: scope.personalInfo
			}).then(function mySucces(response) {

				bootstrapNotify.show('success','Personal info successfully updated');
				scope.views.profilePicture = 'pictures/'+scope.personalInfo.empid+'.jpg';
				self.start(scope);
				self.onSave(scope);
				// scope.pop_employees_list();
				
			}, function myError(response) {
				 
			  // error
				
			});	
			
		};
		
		self.view = function(scope) {

			self.onView(scope);

			scope.views.addUpdateTxt = 'Update';
			scope.views.cancelCloseTxt = 'Close';		
			
			scope.generate.id = scope.employee_row.id;
			scope.generate.coverage = "whole";
			
			$timeout(function() {			
				scope.$apply(function() {
					scope.generate.month = null;
					angular.copy([],scope.dtr);
				});
			},500);			
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=view',
			  data: {id: scope.employee_row.id}
			}).then(function mySucces(response) {				
					
				angular.copy(response.data, scope.personalInfo);
				scope.views.employee = response.data.first_name + ' ' + response.data.middle_name + ' ' + response.data.last_name;
				scope.views.empid = response.data.empid;
				scope.views.position = response.data.appointment_status;
				scope.personalInfo.birthday = new Date(response.data.birthday);
				if (response.data['has_profile_pic']) scope.views.profilePicture = 'pictures/'+response.data['empid']+'/'+response.data['empid']+response.data['photo_type'];
				else scope.views.profilePicture = "img/avatar.png";
				
			}, function myError(response) {
				 
			  // error
				
			});				
			
		};
		
		self.edit = function(scope) {
			
			self.onEdit(scope);
			
		};
		
		self.confirmDel = function(scope) {

			bootstrapModal.confirm(scope,'Are you sure want to delete this record?','appService.del(this)');
			
		};
		
		self.del = function(scope) {
		
			self.onCancel(scope);		
			
			bootstrapModal.closeConfirm();
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=cancel',
			  data: {id: [scope.personalInfo.id], empid: scope.personalInfo.empid}
			}).then(function mySucces(response) {
				
				self.start(scope);
				
				scope.personalInfo = {};
				scope.personalInfo.id = 0;				
				scope.views.profilePicture = "img/avatar.png";
				scope.views.addUpdateTxt = 'Save';
				scope.views.cancelCloseTxt = 'Cancel';
				
				angular.forEach(self.required, function(item, i) {
					if ((scope.personalInfo[item] == '') || (scope.personalInfo[item] == undefined)) {
						scope.frmHolder.personalInfo[item].$invalid = true;
						scope.frmHolder.personalInfo[item].$touched = false;
					}
				});			
				
			}, function myError(response) {
				 
			  // error
				
			});
			
		};
		
		self.dtr = function(scope,regen) {
			
			if (scope.generate.month == null) {
				scope.dtr = [];
				return;
			};
			
			if (regen) bootstrapModal.closeConfirm();
			
			blockUI.show();
			
			scope.generate.regen = regen;
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=dtr',
			  data: scope.generate
			}).then(function mySucces(response) {
								
				scope.dtr = response.data;
				scope.generate.regen = false;
				blockUI.hide();
				
			}, function myError(response) {
				 
			  // error
				
			});			
			
		};
		
		self.dtrRegen = function(scope) {
			
			if (scope.generate.month == null) {
				bootstrapNotify.show('danger','Please select month');
				return;
			};
			bootstrapModal.confirm(scope,'Are you sure want to regenerate DTR?','appService.dtr(this,true)');

		};
		
		self.manageDTR = function() {

			return new function() {

				this.show = function (scope,dtr_row) {
					
					if (scope.$id > 2) scope = scope.$parent;
					
					var d = new Date(dtr_row.ddate);
					var df = d.toUTCString();

					scope.views.assignLog.alert = false;

					bootstrapModal.show(scope,'Manage DTR - '+df.substring(0,16),'views/dtr.html',null,function() { self.dtr(scope,false); });

					dtr(scope,dtr_row);

				};

				function dtr(scope,dtr_row) {
					
					$http({
					  method: 'POST',
					  url: 'controllers/employees.php?r=manageDtr',
					  data: {id: dtr_row.id}
					}).then(function mySucces(response) {
						
						response.data['dtr_specific']['morning_in'] = new Date('2000-01-01 '+response.data['dtr_specific']['morning_in']);
						response.data['dtr_specific']['morning_out'] = new Date('2000-01-01 '+response.data['dtr_specific']['morning_out']);
						response.data['dtr_specific']['afternoon_in'] = new Date('2000-01-01 '+response.data['dtr_specific']['afternoon_in']);
						response.data['dtr_specific']['afternoon_out'] = new Date('2000-01-01 '+response.data['dtr_specific']['afternoon_out']);
						
						scope.dtr_specific = response.data['dtr_specific'];						
						scope.backlogs = response.data['backlogs'];
						
					}, function myError(response) {
						 
					  // error
						
					});						
					
				};
				
				this.edit = function(scope) {

					if (!scope.dtr_specific.edit) {

						$http({
						  method: 'POST',
						  url: 'controllers/employees.php?r=saveDtr',
						  data: scope.dtr_specific
						}).then(function mySucces(response) {
							
							// self.dtr(scope,false);
							
						}, function myError(response) {
							 
						  // error
							
						});						
						
					};					
					
					scope.dtr_specific.edit = !scope.dtr_specific.edit;
					
				};
				
				this.assignLog = function(scope,blog) {

					if (scope.$id > 2) scope = scope.$parent;
				
					scope.views.assignLog.alert = false;
					scope.views.assignLog.alertDanger = false;						
					scope.views.assignLog.alertMsg = '';				
				
					if (blog.assignment == "") {
						
						scope.views.assignLog.alert = true;
						scope.views.assignLog.alertDanger = true;						
						scope.views.assignLog.alertMsg = 'Please select assignment';						
						return;
						
					}
					
					$http({
					  method: 'POST',
					  url: 'controllers/employees.php?r=assignLog',
					  data: {id: scope.dtr_specific.id, log: blog}
					}).then(function mySucces(response) {
						
						scope.views.assignLog.alert = true;
						scope.views.assignLog.alertInfo = true;
						scope.views.assignLog.alertMsg = blog.log+' was assigned as '+blog.assignment.split("_")[0]+' '+blog.assignment.split("_")[1];
						$timeout(function() {
							scope.$apply(function() {
								dtr(scope,scope.dtr_specific);
							});
						},500);
						
					}, function myError(response) {
						 
					  // error
						
					});				
					
				};
				
			};
			
		};
		
		self.printDTR = function() {

			$('#print-dtr').submit();
			
		};

		self.batchPrinting = function(scope) {

			scope.batch.coverage = "whole";
			scope.batch.appointment_status = { id: "All", name: "All" };

			scope.noStaffs = false;
			scope.batchNoMonth = false;

			scope.batchPrinting = [];

			bootstrapModal.batchPrinting(scope,'Batch Printing','views/batch.html',null,function() {
				scope.$apply(function() {
					scope.currentPage = 1;
					scope.currentPagePrinting = 1;
				})
			});

		}

		self.queueForPrinting = function(scope) {

			const check = scope.batchPrinting.filter(bp => {
				return bp.empid == scope.ep.empid
			});

			if (check.length == 0) scope.batchPrinting.push(scope.ep);

		}

		self.queueForPrintingAll = function(scope) {

			scope.employeesPrinting.forEach(em => {
				const check = scope.batchPrinting.filter(bp => {
					return bp.empid == em.empid
				})
				if (check.length == 0) scope.batchPrinting.push(em);					
			});		

		}

		self.unqueueForPrinting = function(scope) {

			const index = scope.batchPrinting.indexOf(scope.bp);
			scope.batchPrinting.splice(index,1);

		}

		self.unqueueForPrintingAll = function(scope) {

			scope.batchPrinting = [];

		}

		self.batchStatusChange = function(scope) {

			const employees = [...scope.employees];

			if (scope.batch.appointment_status.id == "All") {

				scope.employeesPrinting = [...employees];

			} else {

				const employeesPrinting = employees.filter(emp => {
					return emp.appointment_status == scope.batch.appointment_status.id;
				})
				scope.employeesPrinting = [...employeesPrinting];				

			}

		}

		self.printBatch = function(scope) {

			scope.noStaffs = false;
			scope.batchNoMonth = false;

			if (scope.batch.month == null) {
				scope.batchNoMonth = true;
				return;
			}

			if (scope.batchPrinting.length==0) {
				scope.noStaffs = true;
				return;
			}

			$('#print-dtr-batch').submit();

		}
		
	};
	
	return new appService();
	
});

app.controller('employeesCtrl', function($scope,$http,blockUI,bootstrapModal,bootstrapNotify,fileUpload,appService) {

$scope.currentPage = 1;
$scope.pageSize = 15;

$scope.currentPagePrinting = 1;
$scope.pageSizePrinting = 15;

$scope.views = {};
$scope.frmHolder = {};

$scope.views.profilePicture = 'img/avatar.png';
$scope.views.showProPicUploadProgress = false;

$scope.personalInfo = {id: 0};
$scope.personalInfo.schedule = {id: 0, description: "Default"};
$scope.controls = {};
$scope.controls.personalInfo = {};
$scope.controls.personalInfo.addBtn = false;

$scope.views.addUpdateTxt = 'Save';
$scope.views.cancelCloseTxt = 'Cancel';

$scope.views.appointmentStatus = {
	"Permanent": "Permanent",
	"Casual": "Casual",
	"Job Order": "JO",
	"Volunteer": "Volunteer"
};

$scope.views.months = {
	"January": "01",
	"February": "02",
	"March": "03",
	"April": "04",
	"May": "05",
	"June": "06",
	"July": "07",
	"August": "08",
	"September": "09",
	"October": "10",
	"November": "11",
	"December": "12"	
};

/* $scope.pop_employees_list = function() {

	$http.get('controllers/employees.php?r=list').then(function(response) {
		$scope.employees_list = response.data;
	});

}; */

// $scope.pop_employees_list();

$scope.dtr = [];

$scope.batchPrinting = [];
$scope.batch = {};
$scope.batch.year = (new Date()).getFullYear();
$scope.batch.month = null;
$scope.batch.coverage = "whole";
$scope.batch.appointmentStatus = [
	{ id: "All", name: "All" },
	{ id: "Permanent", name: "Permanent" },
	{ id: "Casual", name: "Casual" },
	{ id: "JO", name: "Job Order" },
	{ id: "Volunteer", name: "Volunteer"},
];
$scope.batch.appointment_status = { id: "All", name: "All" };

$scope.generate = {};
$scope.generate.id = 0;
$scope.generate.year = (new Date()).getFullYear();
$scope.generate.regen = false;

/* $scope.employeeSelected = function(item, model, label, event) {
	$scope.generate.id = item.id;
	$scope.generate.employee_fullname = item.employee_fullname;
}; */

$scope.views.employee = "";
$scope.views.empid = "";
$scope.views.position = "";

$scope.views.assignLog = {};

$http({
  method: 'POST',
  url: 'controllers/employees.php?r=schedules',
}).then(function mySucces(response) {
	
	$scope.views.schedules = response.data;
	
}, function myError(response) {
	 
  // error
	
});

var appServiceL = appService;
$scope.appService = appService;
$scope.manageDTR = appService.manageDTR();

appServiceL.controls($scope,true);
appServiceL.start($scope);

$scope.uploadProfilePicture = function() {
	
   if (($scope.personalInfo.empid == '') || ($scope.personalInfo.empid == undefined)) {
	   
		bootstrapNotify.show('danger','You must provide employee id first before you can upload profile picture');
		$scope.frmHolder.personalInfo.empid.$touched = true;
		return;
	   
   }	
	
   // $scope.proPic = null;
   var file = $scope.views.proPic;
   
   if (file == undefined) return;
   
   var pp = file['name'];
   var en = pp.substring(pp.indexOf("."),pp.length);

   var uploadUrl = "controllers/employees.php?r=upload_profile_picture&empid="+$scope.personalInfo.empid+"&en="+en;
   fileUpload.uploadFileToUrl(file, uploadUrl, $scope);
	
};

});