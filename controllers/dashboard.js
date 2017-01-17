var app = angular.module('dashboard', ['block-ui','bootstrap-modal','bootstrap-notify','account']);

app.directive('fileModel', ['$parse', function ($parse) {
	return {
	   restrict: 'A',
	   link: function(scope, element, attrs) {
		  var model = $parse(attrs.fileModel);
		  var modelSetter = model.assign;
		  
		  element.bind('change', function(){
			  
			scope.$apply(function(){
				modelSetter(scope, element[0].files[0]);
			});
			 
		  });

	   }
	};
}]);

app.service('fileUpload', function (consoleMsg) {
	
	this.uploadFileToUrl = function(file, uploadUrl, scope) {
	   var fd = new FormData();
	   fd.append('file', file);
	
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.open("POST", uploadUrl)
        xhr.send(fd);
	   
		// upload progress
		function uploadProgress(evt) {
			scope.views.showLogUploadProgress = true;
			scope.$apply(function(){
				scope.views.progress = 0;				
				if (evt.lengthComputable) {
					scope.views.progress = Math.round(evt.loaded * 100 / evt.total);
				} else {
					scope.views.progress = 'unable to compute';
				}
			});
		}

		function uploadComplete(evt) {
			/* This event is raised when the server send back a response */
			scope.$apply(function(){
				scope.views.showLogUploadProgress = false;
				consoleMsg.show(200,'Log file uploaded','a');
			});			

		}

	}
	
});

app.service('consoleMsg', function() {
	
	this.show = function(code,msg,opt = 'a') {
		
		var codeClass = 'success-response';
		if (code == 300) codeClass = 'info-response';
		else if (code == 400) codeClass = 'error-response';
		
		if (opt == 'a') $('.console').append('<span class="'+codeClass+'">'+msg+'</span>');
		else $('.console').html('<span class="'+codeClass+'">'+msg+'</span>');
		
		$('.console').scrollTop(($('.console')[0]).scrollHeight);		
		
	}
	
});

app.controller('dashboardCtrl', function($scope,blockUI,bootstrapModal,bootstrapNotify,fileUpload,consoleMsg) {

$scope.views = {};
$scope.frmHolder = {};

$scope.views.errorBox = false;
$scope.views.errorMsg = "";

$scope.views.showLogUploadProgress = false;
$scope.views.progress = 0;

// r = new line, a = append
// consoleMsg.show(200,'Lorem Ipsum...','a'); // success
// consoleMsg.show(300,'Lorem Ipsum...','a'); // info
// consoleMsg.show(400,'Lorem Ipsum...','a'); // error
	
});