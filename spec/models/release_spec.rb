require 'spec_helper'

describe Release do
	
	it 'has a valid Fabricator' do
		expect(Fabricate(:release)).to be_valid
	end

	it 'is invalid without a name' do 
    release = Fabricate.build(:release, name: nil)
    expect(release).to_not be_valid
	end

	it 'is invalid without an artist association' do
		release = Fabricate.build(:release, artist: nil)
		expect(release).to_not be_valid
	end

  it 'belongs to an artist' do
    expect(Fabricate(:release).artist).to be_an Artist
  end

end