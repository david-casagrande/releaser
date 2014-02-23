require 'ffaker'

Fabricator :user do
	email Faker::Internet.email
	password 'secret123'
end
