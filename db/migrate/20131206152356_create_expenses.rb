class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.string :description
    	t.decimal :cost, precision: 8, scale: 2
    end
  end
end
