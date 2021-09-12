angular.module('bootstrap-notify',[]).service('bootstrapNotify', function() {

	this.show = function(type,msg) {
		
		$.notify({
			message: msg
		},{
			type: type,
			offset: 50,
			z_index: 5000,
		});
		
	}

});