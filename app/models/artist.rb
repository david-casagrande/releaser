class Artist < ActiveRecord::Base
	
	has_paper_trail
	
	has_many :releases, dependent: :destroy

	validates :name, presence: true

end
