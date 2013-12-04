class Release < ActiveRecord::Base
	
	belongs_to :artist

  validates :artist, presence: true
	validates :name, presence: true

end
