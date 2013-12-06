class AddReleaseIdToExpenses < ActiveRecord::Migration
  def change
    add_column(:expenses, :release_id, :integer)
  end
end
