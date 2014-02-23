class ChangeAuthorToAuthorId < ActiveRecord::Migration
  def change
  	rename_column :expenses, :author, :author_id
  	rename_column :releases, :author, :author_id
  	rename_column :artists, :author,  :author_id
  end
end
