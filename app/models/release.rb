class Release < ActiveRecord::Base
	#mount_uploader :cover, CoverUploader

	belongs_to :artist
	has_many   :expenses

  validates :artist, presence: true
	validates :name, presence: true

end
