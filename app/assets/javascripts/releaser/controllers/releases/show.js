Releaser.ReleasesShowController = Ember.ObjectController.extend(Ember.Validations.Mixin, {
	
	newExpenseCost: 			 null,
	newExpenseDescription: null,

	actions: {
		createNewExpense: function(){
			this.createExpense()
		}
	},

	createExpense: function(){
		if(this.get('isValid')){
			console.log( this.get('errors.newExpenseCost'), this.get('errors.newExpenseDescription') );
		}
		else{
			var costError        = this.get('errors.newExpenseCost').join(', '),
					descriptionError = this.get('errors.newExpenseDescription').join(', '),
					errors           = ['cost '+costError, 'description '+descriptionError];
			console.log( errors.join(' and '));
		}
	},

	validations: {
    newExpenseCost: {
      presence:     true,
      numericality: true
    },
    newExpenseDescription: {
      presence: true
    }
  }
});
