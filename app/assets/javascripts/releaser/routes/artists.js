//= require ../mixins/route_crud

Releaser.ArtistsRoute = Ember.Route.extend(Releaser.RouteCrud, {

	actions: {

		saveArtist: function(record){
			this.saveRecord(record, 'artists.show');
		},

		deleteArtist: function(record){
			this.deleteRecord(record, 'artists.index');
		}		

	},

	model: function(){
		return this.get('store').find('artist');
	},

	deleteRecordSuccess: function(record, route){
		this.deleteArtistReleases(record);
		this._super(record, route);
	},

	deleteArtistReleases: function(artist){
		artist.get('releases').forEach(function(release){
			release.deleteRecord();
		});
	}

});
