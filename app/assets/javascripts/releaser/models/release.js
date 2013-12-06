Releaser.Release = DS.Model.extend({
	artist:          DS.belongsTo('artist', { async: true }),
	catalogueNumber: DS.attr('string'),
	expenses:        DS.hasMany('expense', { async: true }),
	name: 					 DS.attr('string')
});
