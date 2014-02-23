class AddAuthorToExpensesReleasesAndArtists < ActiveRecord::Migration
  def change
    add_column(:expenses, :author, :integer)
    add_column(:releases, :author, :integer)
    add_column(:artists,  :author, :integer)
  end
end
