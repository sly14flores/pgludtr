angular.module('account',['bootstrap-modal']).directive('logout', function($window,bootstrapModal) {

	return {
	    restrict: 'A',
	    link: function(scope, element, attrs) {
		
			element.bind('click', function() {
					
				bootstrapModal.confirm(scope,'Are you sure you want to logout?','logout()');
					
			});

			scope.logout = function() {
				
				$window.location.href = 'modules/logout.php';
				
			};
		
	    }
	};
	
}).directive('setting', function(bootstrapModal, $http, bootstrapNotify) {

	return {
	    restrict: 'A',
	    link: function(scope, element, attrs) {
		
			function show() {
				
				$http({
					method: 'GET',
					url: 'controllers/settings.php?r=view',
				}).then(function mySucces(response) {

					scope.setting = response.data
					  
				}, function myError(response) {
					   
					// error
					  
				});

			}

			element.bind('click', function() {
					
				bootstrapModal.setting(scope,'Settings','views/setting.html','updateSetting()',show,function() {

				});
					
			});

			scope.updateSetting =  function() {

				scope.frmHolder.setting.dtr_header.$touched = true;
				scope.frmHolder.setting.dtr_sub_header.$touched = true;

				if (scope.frmHolder.setting.$invalid) {
					bootstrapNotify.show('danger','Please fill up the required field(s)');					
					return
				}

				$http({
					method: 'POST',
					url: 'controllers/settings.php?r=update',
					data: scope.setting
				}).then(function mySucces(response) {
	  
					  bootstrapNotify.show('success','Settings successfully updated');
					  
				}, function myError(response) {
					   
					// error
					  
				});

			};
		
	    }
	};	

});