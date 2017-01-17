var app = angular.module('employees', ['angularUtils.directives.dirPagination','block-ui','bootstrap-modal','bootstrap-notify','account']);

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
			/* This event is raised when the server send back a response */
			scope.$apply(function() {

				scope.views.profilePicture = 'pictures/'+scope.personalInfo.empid+'.jpg';
				scope.views.showProPicUploadProgress = false;

			});			

			$('#proPic').val(null);
		}

	}
}]);

app.factory('appService',function($http,$timeout,bootstrapNotify,bootstrapModal) {
	
	function appService() {
		
		var self = this;
		
		this.controls = function(scope,opt) {
			
			scope.controls.personalInfo = {
				picture: opt,
				empid: opt,
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
		
		this.onAdd = function(scope) {
			self.controls(scope,false);
			scope.controls.personalInfo.addBtn = true;
			scope.controls.personalInfo.editBtn = true;
			scope.controls.personalInfo.delBtn = true;
		};
		
		this.onCancel = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;			
		};
		
		this.onSave = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;
		};
		
		this.onView = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;
		};
		
		this.onEdit = function(scope) {
			self.controls(scope,false);
			scope.controls.personalInfo.addBtn = true;
			scope.controls.personalInfo.editBtn = true;
			scope.controls.personalInfo.delBtn = true;			
		};
		
		this.onClose = function(scope) {
			self.controls(scope,true);
			scope.controls.personalInfo.addBtn = false;
			scope.controls.personalInfo.editBtn = false;
			scope.controls.personalInfo.delBtn = false;			
		};
		
		this.required = ['empid', 'first_name', 'middle_name', 'last_name'];
		
		this.start = function(scope) {

			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=start'
			}).then(function mySucces(response) {
			
				scope.employees = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});
			
		};
		
		this.add = function(scope) {
			
			self.onAdd(scope);

			scope.personalInfo = {};
			scope.personalInfo.id = 0;
			scope.views.profilePicture = "img/avatar.png";
			
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
		
		this.cancel = function(scope) {
			
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
		
		this.update = function(scope) {

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
				
			}, function myError(response) {
				 
			  // error
				
			});	
			
		};
		
		this.view = function(scope) {
			
			self.onView(scope);

			scope.views.addUpdateTxt = 'Update';
			scope.views.cancelCloseTxt = 'Close';		
			
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=view',
			  data: {id: scope.employee.id}
			}).then(function mySucces(response) {
			
				angular.copy(response.data, scope.personalInfo);
				scope.personalInfo.birthday = new Date(response.data.birthday);
				if (response.data['has_profile_pic']) scope.views.profilePicture = 'pictures/'+response.data['empid']+'.jpg';
				else scope.views.profilePicture = "img/avatar.png";
				
			}, function myError(response) {
				 
			  // error
				
			});				
			
		};
		
		this.edit = function(scope) {
			
			self.onEdit(scope);
			
		};
		
		this.confirmDel = function(scope) {

			bootstrapModal.confirm(scope,'Are you sure want to delete this record?','appService.del(this)');
			
		};
		
		this.del = function(scope) {
		
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
		
	};
	
	return new appService();
	
});

app.controller('employeesCtrl', function($scope,blockUI,bootstrapModal,bootstrapNotify,fileUpload,appService) {

$scope.currentPage = 1;
$scope.pageSize = 15;

$scope.views = {};
$scope.frmHolder = {};

$scope.views.profilePicture = 'img/avatar.png';
$scope.views.showProPicUploadProgress = false;

$scope.personalInfo = {id: 0};
$scope.controls = {};
$scope.controls.personalInfo = {};
$scope.controls.personalInfo.addBtn = false;

$scope.views.addUpdateTxt = 'Save';
$scope.views.cancelCloseTxt = 'Cancel';

$scope.views.appointmentStatus = {
	"Permanent": "Permanent",
	"Casual": "Casual",
	"Job Order": "JO"
};

var appServiceL = appService;
$scope.appService = appService;

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
   console.log(file);
   
   var pp = file['name'];
   var en = pp.substring(pp.indexOf("."),pp.length);

   var uploadUrl = "controllers/employees.php?r=upload_profile_picture&empid="+$scope.personalInfo.empid+"&en="+en;
   fileUpload.uploadFileToUrl(file, uploadUrl, $scope);
	
};

});