class AddCoverToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :cover, :string
  end
end
