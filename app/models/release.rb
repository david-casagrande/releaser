class Release < ActiveRecord::Base
	#mount_uploader :cover, CoverUploader

	belongs_to :artist

  validates :artist, presence: true
	validates :name, presence: true

end
