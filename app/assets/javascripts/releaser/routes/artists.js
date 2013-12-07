Releaser.ArtistsRoute = Ember.Route.extend({

	actions: {

		saveArtist: function(record){
			this.saveRecord(record);
		},

		deleteArtist: function(record){
			this.deleteRecord(record);
		}		

	},

	model: function(){
		return this.get('store').find('artist');
	},

	saveRecord: function(record){
		var self = this;

		record.save()
			.then(function(){
				self.transitionTo('artists.show', record);
			}, function(errors){
				alert(errors.message);
			});
	},

	deleteRecord: function(record){
		var self = this;

		record.deleteRecord();
		record.save()
			.then(function(){
				self.deleteArtistReleases(record);
				self.transitionTo('artists.index');
			}, function(errors){
				alert(errors.message);
			});
	},

	deleteArtistReleases: function(artist){
		artist.get('releases').forEach(function(release){
			release.deleteRecord();
		});
	}

});
