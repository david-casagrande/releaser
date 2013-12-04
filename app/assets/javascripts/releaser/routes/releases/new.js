Releaser.ReleasesNewRoute = Ember.Route.extend({

	model: function(){
		return this.get('store').createRecord('release');
	},
	
	setupController: function(controller, model) {
		controller.setProperties({
			model: model,
			availableArtists: this.get('store').find('artist')
		});
	}

});
