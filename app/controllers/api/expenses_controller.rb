class Api::ExpensesController < ApplicationController

	def index
		respond_with expenses
	end

	def show
		respond_with expense
	end

	private 
	def expenses
		@expenses ||= params[:ids] ? Expense.find(params[:ids]) : Expense.all
	end

	def expense
		@expense ||= Expense.find(params[:id])
	end

end