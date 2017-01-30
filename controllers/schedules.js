var app = angular.module('schedules', ['block-ui','bootstrap-modal','bootstrap-notify','account']);

app.controller('schedulesCtrl',function($scope) {
	
$scope.currentPage = 1;
$scope.pageSize = 15;

$scope.views = {};
$scope.frmHolder = {};
	
});