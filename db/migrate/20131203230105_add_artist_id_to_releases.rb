class AddArtistIdToReleases < ActiveRecord::Migration
  def change
  	add_column :releases, :artist_id, :integer
  end
end
