Releaser.ReleasesRoute = Ember.Route.extend({
	
	actions: {

		saveRelease: function(record){
			this.saveRecord(record);
		},
		
		deleteRelease: function(record){
			this.deleteRecord(record);
		}

	},

	model: function(){
		return this.get('store').find('release');
	},

	saveRecord: function(record){
		var self = this;

		record.save()
			.then(function(){
				self.transitionTo('releases.show', record);
			}, function(errors){
				alert(errors.message);
			});
	},

	deleteRecord: function(record){
		var self = this;

		record.deleteRecord();
		record.save()
			.then(function(){
				self.transitionTo('releases.index');
			}, function(errors){
				alert(errors.message);
			});
	}

});
