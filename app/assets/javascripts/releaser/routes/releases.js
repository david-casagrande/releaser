//= require ../mixins/route_crud

Releaser.ReleasesRoute = Ember.Route.extend(Releaser.RouteCrud, {
	
	actions: {

		saveRelease: function(record){
			this.saveRecord(record, 'releases.show');
		},
		
		deleteRelease: function(record){
			this.deleteRecord(record, 'releases.index');
		}

	},

	model: function(){
		return this.get('store').find('release');
	}

});
