require 'spec_helper'

describe Api::ExpensesController do

  describe 'GET :index' do

    it 'populates an array of expenses' do
  		expenses = [Fabricate(:expense), Fabricate(:expense)]
    	get :index, format: :json
    	expected = ActiveModel::ArraySerializer.new(expenses, root: 'expenses')
      expect(response.body).to eq(expected.to_json)
    end

    it 'populates an array of expenses of requested ids' do
      expenses = [Fabricate(:expense), Fabricate(:expense), Fabricate(:expense)]
      get :index, ids: [expenses[0].id, expenses[2].id], format: :json
      expected = ActiveModel::ArraySerializer.new([expenses[0], expenses[2]], root: 'expenses')
      expect(response.body).to eq(expected.to_json)
    end

  end

  describe 'GET :show' do
    
    it 'returns the requested expense' do
  		expense = Fabricate(:expense)
    	get :show, id: expense, format: :json
    	expected = ExpenseSerializer.new(expense)
      expect(response.body).to eq(expected.to_json)
    end
    
  end

  describe 'POST :create' do

    it 'creates a new expense' do
      expect{ 
        post :create, expense: Fabricate.attributes_for(:expense), format: :json
      }.to change(Expense, :count).by(1)
    end

  end

  describe 'PUT :update' do

    it 'updates an expense' do
      expense = Fabricate(:expense)
      put :update, id: expense, expense: Fabricate.attributes_for(:expense, cost: '55.55'), format: :json
      expense.reload
      expect(expense.cost).to eq(55.55)
    end

  end  

  describe 'DELETE :destroy' do
    
    it 'deletes a expense' do
      expense = Fabricate(:expense)
      expect do
        delete :destroy, id: expense.id, format: :json
      end.to change(Expense, :count).by(-1)
    end
  
  end

end
