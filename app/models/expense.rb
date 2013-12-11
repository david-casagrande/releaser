class Expense < ActiveRecord::Base

	has_paper_trail

	belongs_to :release

	validates :release, presence: true

end
