class Release < ActiveRecord::Base
	#mount_uploader :cover, CoverUploader

	has_paper_trail

	belongs_to :artist
	has_many   :expenses, dependent: :destroy

  validates :artist, presence: true
	validates :name, presence: true
	validates :catalogue_number, presence: true, uniqueness: true
	
end
