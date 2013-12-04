class RemoveArtistColumnFromReleases < ActiveRecord::Migration
  def change
  	remove_column :releases, :artist
  end
end
