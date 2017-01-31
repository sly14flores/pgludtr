var app = angular.module('schedules', ['angularUtils.directives.dirPagination','block-ui','bootstrap-modal','bootstrap-notify','account']);

app.factory('appService',function($http,$timeout,bootstrapNotify,bootstrapModal) {
	
	function appService() {
		
		var self = this;
		
		this.controls = function(scope,opt) {
			
			scope.controls.schedule = {
				description: opt,
				morning_in: opt,
				morning_out: opt,
				afternoon_in: opt,
				afternoon_out: opt,
				dayoff: opt,
				transcending: opt,
				transcending_days_no: opt,
				saveBtn: opt,
				cancelBtn: opt,
				editBtn: opt,
				delBtn: opt
			};
			
		};
		
		this.start = function(scope) {

			$http({
			  method: 'POST',
			  url: 'controllers/schedules.php?r=start'
			}).then(function mySucces(response) {

				scope.schedules = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});
			
		};		
		
		this.required = [];
		
		this.onAdd = function(scope) {
			self.controls(scope,false);
			scope.controls.schedule.addBtn = true;
			scope.controls.schedule.editBtn = true;
			scope.controls.schedule.delBtn = true;	
		};
		
		this.onUpdate = function(scope) {
			self.controls(scope,true);
			scope.controls.schedule.addBtn = false;
			scope.controls.schedule.editBtn = true;
			scope.controls.schedule.delBtn = true;		
		};
		
		this.onCancel = function(scope) {
			self.controls(scope,true);
			scope.controls.schedule.addBtn = false;
			scope.controls.schedule.editBtn = true;
			scope.controls.schedule.delBtn = true;				
		};
		
		this.add = function(scope) {
			
			self.onAdd(scope);			
			
			scope.views.addUpdateTxt = 'Save';
			scope.views.cancelCloseTxt = 'Cancel';
			
			// insert new schedule
			
			$http({
			  method: 'POST',
			  url: 'controllers/schedules.php?r=new',
			  data: scope.schedule
			}).then(function mySucces(response) {
			
				scope.schedule.id = response.data;
				
			}, function myError(response) {
				 
			  // error
				
			});				
			
		};
		
		this.update = function(scope) {
			
			if (scope.frmHolder.schedule.$invalid) {
				scope.frmHolder.schedule.description.$touched = true;
				bootstrapNotify.show('danger','Please fill up description');			
				return;
			}
			
			self.onUpdate(scope);
			
			$http({
			  method: 'POST',
			  url: 'controllers/schedules.php?r=update',
			  data: scope.schedule
			}).then(function mySucces(response) {
			
				self.start(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});				
			
		};
		
		this.cancel = function(scope) {
			
			$http({
			  method: 'POST',
			  url: 'controllers/schedules.php?r=cancel',
			  data: {id: [scope.schedule.id]}
			}).then(function mySucces(response) {
				
				scope.schedule = {
					id: 0,
					description: "",
					details: [
						{day: "Monday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Tuesday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Wednesday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Thursday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Friday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Saturday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
						{day: "Sunday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0}
					]
				};
				
				self.onCancel(scope);
				self.start(scope);
				
			}, function myError(response) {
				 
			  // error
				
			});			
			
		};
		
		this.view = function(scope) {

		};
		
	};
	
	return new appService();
	
});

app.controller('schedulesCtrl',function($scope,appService) {
	
$scope.currentPage = 1;
$scope.pageSize = 10;

$scope.views = {};
$scope.frmHolder = {};

$scope.controls = {};
$scope.controls.schedule = {};

$scope.schedule = {
	id: 0,
	description: "",
	details: [
		{day: "Monday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Tuesday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Wednesday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Thursday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Friday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Saturday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0},
		{day: "Sunday", morning_in: new Date("0"), morning_out: new Date("0"), afternoon_in: new Date("0"), afternoon_out: new Date("0"), dayoff: "0", transcending: "0", transcending_days_no: 0}
	]
};

$scope.views.addUpdateTxt = "Save";
$scope.views.cancelCloseTxt = "Cancel";

$scope.controls.schedule.addBtn = false;

var appServiceL = appService;
$scope.appService = appService;

appServiceL.controls($scope,true);
appServiceL.start($scope);
	
});