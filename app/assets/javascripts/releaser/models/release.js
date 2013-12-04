Releaser.Release = DS.Model.extend({
	artist:          DS.belongsTo('artist', {async: true}),
	catalogueNumber: DS.attr('string'),
	name: 					 DS.attr('string')
});
