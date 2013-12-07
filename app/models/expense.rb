class Expense < ActiveRecord::Base

	belongs_to :release

	validates :release, presence: true

end
