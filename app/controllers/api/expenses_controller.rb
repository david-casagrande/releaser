module API

	class ExpensesController < ApplicationController

		def index
			respond_with expenses
		end

		def show
			respond_with expense
		end

		def create
			author = { author_id: current_user.id }
			@expense = Expense.create(expense_params.merge(author))
			respond_with expense, location: api_expenses_url(expense)
		end

		def update
			expense.update(expense_params)
			respond_with expense, location: api_expenses_url(expense)
		end

		def destroy
			expense.destroy
	    respond_with expense, location: api_expenses_url
		end

		private 
		def expenses
			@expenses ||= params[:ids] ? Expense.find(params[:ids]) : Expense.all
		end

		def expense
			@expense ||= Expense.find(params[:id])
		end

		def expense_params
	    params.require(:expense).permit(
	    	:cost,
	    	:description,
	    	:release_id
	    )
		end

	end
end
