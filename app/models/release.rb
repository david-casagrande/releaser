class Release < ActiveRecord::Base
	#mount_uploader :cover, CoverUploader

	belongs_to :artist
	has_many   :expenses, dependent: :destroy

  validates :artist, presence: true
	validates :name, presence: true

end
