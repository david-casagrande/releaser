Fabricator :release do
	artist
	name  { %w(Land Empty\ City Uncanney\ Valley).sample }
	catalogue_number  { sequence(:email) { |i| "CER0#{i}" } }
end
