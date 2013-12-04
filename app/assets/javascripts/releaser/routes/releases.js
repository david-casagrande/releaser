Releaser.ReleasesRoute = Ember.Route.extend({
	
	actions: {
		saveRelease: function(record){
			this.saveRecord(record);
		}
	},

	model: function(){
		return this.get('store').find('release');
	},

	saveRecord: function(record){
		record.save();
	}

});
