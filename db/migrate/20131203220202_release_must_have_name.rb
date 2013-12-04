class ReleaseMustHaveName < ActiveRecord::Migration
  def change
    change_column :releases, :name, :string, null: false
  end
end
