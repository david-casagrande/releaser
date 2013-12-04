class Artist < ActiveRecord::Base

	has_many :releases

	validates :name, presence: true

end
