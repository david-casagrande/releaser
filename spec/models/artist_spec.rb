require 'spec_helper'

describe Artist do
	
	it 'has a valid Fabricator' do
		expect(Fabricate(:artist)).to be_valid
	end

	it 'is invalid without a name' do
		artist = Fabricate.build(:artist, name: nil)
		expect(artist).to_not be_valid
	end

  it 'has many releases' do
    expect(Fabricate(:artist)).to respond_to(:releases)
    expect(Fabricate(:artist).releases.build).to be_an_instance_of Release
  end	

end
