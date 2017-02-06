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
		
		this.required = ['empid', 'first_name', 'middle_name', 'last_name', 'schedule_id'];
		
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
			  data: {id: scope.employee_row.id}
			}).then(function mySucces(response) {
			
				angular.copy(response.data, scope.personalInfo);
				scope.views.employee = response.data.first_name + ' ' + response.data.middle_name + ' ' + response.data.last_name;
				scope.views.empid = response.data.empid;
				scope.views.position = response.data.appointment_status;
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
		
		this.printDTRJspsf = function() {
		
			$http({
			  method: 'POST',
			  url: 'controllers/employees.php?r=dtr',
			  data: {},
			  headers : {'Content-Type': 'application/x-www-form-urlencoded'}
			}).then(function mySucces(response) {		
			
				var doc = new jsPDF({
				  orientation: 'portrait',
				  unit: 'pt',
				  format: [612, 936]
				});			

				var totalPagesExp = "{total_pages_count_string}";

				var pageContent = function (data) {

					// HEADER
					doc.setFontSize(12);
					doc.setTextColor(50);
					doc.setFontStyle('bold');
					doc.textWithAlignment("Provincial Government of La Union", {align: "center"}, 0, 40);
					doc.setFontSize(10);
					doc.setTextColor(80);
					doc.setFontStyle('normal');				
					doc.textWithAlignment("San Fernando City, La Union", {align: "center"}, 0, 55);
					doc.setFontSize(16);
					doc.setTextColor(50);
					doc.textWithAlignment("Daily Time Record", {align: "center"}, 0, 85);
					doc.setFontSize(12);
					doc.setTextColor(70);
					doc.setFontStyle('bold');
					doc.text("QUINIVISTA, VANESSA L.", data.settings.margin.left, 110);
					doc.line(data.settings.margin.left, 114, data.table.width+data.settings.margin.left, 114);
					doc.setFontSize(10);
					doc.setFontStyle('normal');
					doc.text("December 2016", data.settings.margin.left, 125);
					doc.textWithAlignment("BDH Casuals", {align: "right", margin: data.settings.margin.right}, 0, 125);
					doc.setTextColor(60);
					doc.text("Total: ", 355, doc.internal.pageSize.height - 150);
					doc.text("Days Absent: ", 320, doc.internal.pageSize.height - 135);
					doc.setFontSize(9);
					doc.setTextColor(80);
					doc.setFontStyle('italic');
					doc.text("I hereby CERTIFY on my honor that the above is true and correct report of the hours of work performed, record of which was made", data.settings.margin.left, doc.internal.pageSize.height - 115);
					doc.text("daily at the time of arrival and departure from Office.", data.settings.margin.left, doc.internal.pageSize.height - 103);
					doc.setFontStyle('bold');					
					doc.textWithAlignment("Verified as to the prescribed office hours:", {align: "right", margin: data.settings.margin.right+10}, 0, doc.internal.pageSize.height - 90);
					doc.setLineWidth(1);
					doc.line(data.settings.margin.left+30, doc.internal.pageSize.height - 60, 280, doc.internal.pageSize.height - 60);					
					doc.line(332, doc.internal.pageSize.height - 60, 542, doc.internal.pageSize.height - 60);
					var employee = "QUINIVISTA, VANESSA L.";
					var signatory = "Head/Supervisor";
					doc.text(employee, (((doc.internal.pageSize.width/2)-((doc.getStringUnitWidth(employee)*doc.internal.getFontSize())/doc.internal.scaleFactor))/2)+20, doc.internal.pageSize.height - 45);
					doc.text(signatory, (((doc.internal.pageSize.width/2)-((doc.getStringUnitWidth(signatory)*doc.internal.getFontSize())/doc.internal.scaleFactor))/2)+306-20, doc.internal.pageSize.height - 45);

					// FOOTER
					var str = "Page " + data.pageCount;
					// Total page number plugin only available in jspdf v1.0+
					if (typeof doc.putTotalPages === 'function') {
						str = str + " of " + totalPagesExp;
					}
					doc.setFontSize(10);
					doc.setTextColor(95);
					doc.text(str, data.settings.margin.left, doc.internal.pageSize.height - 10);
					
				};

				doc.autoTable(response.data.columns, response.data.rows, {
					theme: 'grid',
					addPageContent: pageContent,
					margin: {top: 132},
					headerStyles: {
						fontSize: 10
					},					
					styles: {
						fontSize: 10					
					}					
				});				
				
				// Total page number plugin only available in jspdf v1.0+
				if (typeof doc.putTotalPages === 'function') {
					doc.putTotalPages(totalPagesExp);
				}
			
				doc.output('dataurlnewwindow');
				
			},
			function myError(response) {

			});					
		
		};
		
		this.printDTR = function() {
			
			var dtr = '<input type="hidden" name="id" value="0">';
			$('#print-dtr').html(dtr);
			$('#print-dtr').submit();
			
		};
		
	};
	
	return new appService();
	
});

app.controller('employeesCtrl', function($scope,$http,blockUI,bootstrapModal,bootstrapNotify,fileUpload,appService) {

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
	"Job Order": "JO",
	"Volunteer": "Volunteer"
};

$scope.views.employee = "";
$scope.views.empid = "";
$scope.views.position = "";

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