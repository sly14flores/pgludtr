var app = angular.module('employees', ['angularUtils.directives.dirPagination','block-ui','bootstrap-modal','bootstrap-notify','account']);

app.controller('employeesCtrl', function($scope,blockUI,bootstrapModal,bootstrapNotify) {

$scope.currentPage = 1;
$scope.pageSize = 15;

$scope.views = {};

$scope.views.profilePicture = 'img/avatar.png';
$scope.views.showProPicUploadProgress = false;

$scope.personalInfo = {};

$scope.views.appointmentStatus = {
	"Permanent": "Permanent",
	"Casual": "Casual",
	"Job Order": "JO"
};

$scope.employees = [];

});