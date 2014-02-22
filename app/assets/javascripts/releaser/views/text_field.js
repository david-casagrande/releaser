Ember.TextField.reopen({
	change: function(){
		if(this.get('record')){
			this.get('record').save();
		}
	}
});
