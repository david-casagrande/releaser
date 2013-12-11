//= require spec_helper_lite
//= require releaser/mixins/route_crud

describe('Releaser.RouteCrud', function(){

	before(function(){
		App = Ember.Application.create();
		App.setupForTesting();
		App.injectTestHelpers();

		//use this instead of the default qunit adapter
		Ember.Test.adapter = Ember.Test.Adapter.create({});

		App.Router.map(function(){
			this.resource('test');
		});
  	
		App.TestRoute = Ember.Route.extend(Releaser.RouteCrud);
		App.Model     = DS.Model.extend({ name: DS.attr('string') });
	});

	beforeEach(function(){
		App.reset();
		Ember.run(App, App.advanceReadiness);
	});

	after(function(){
		App.destroy();
	});

	describe('saveRecord', function(){

		it('is here', function(){
			visit('test').then(function(){
				console.log(this);
				expect(true).to.equal('function');
			})
			/*
			var route = App.TestRoute.create();
				
			console.log(route.get('store'));
			//Releaser.Model = DS.Model.extend({ name: DS.attr('string') });

			//var record = store.createRecord('model', { name: 'Test' });
			//var mixin = Ember.Object.createWithMixins(Releaser.RouteCrud);

			expect(true).to.equal('function');
			*/
		});

	});

});
