class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :artists, foreign_key: :author_id
	has_many :expenses, foreign_key: :author_id
	has_many :releases, foreign_key: :author_id
end
