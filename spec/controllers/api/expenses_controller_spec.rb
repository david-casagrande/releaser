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

end
