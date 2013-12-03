class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
    	t.string :artist
    	t.string :name
    	t.string :catalogue_number
      t.timestamps
    end

    add_index :releases, :catalogue_number    
  end
end
