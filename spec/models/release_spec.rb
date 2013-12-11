require 'spec_helper'

describe Release do
	
	it 'has a valid Fabricator' do
		expect(Fabricate(:release)).to be_valid
	end

  it 'belongs to an artist' do
    expect(Fabricate(:release).artist).to be_an Artist
  end

  it 'has many expenses' do
    expect(Fabricate(:release, catalogue_number: 'cer001')).to respond_to(:expenses)
    expect(Fabricate(:release, catalogue_number: 'cer002').expenses.build).to be_an_instance_of Expense
  end	

	it 'is invalid without a name' do 
    release = Fabricate.build(:release, name: nil)
    expect(release).to_not be_valid
	end

	it 'is invalid without an artist association' do
		release = Fabricate.build(:release, artist: nil)
		expect(release).to_not be_valid
	end

	it 'is invalid without a catalogue_number' do 
    release = Fabricate.build(:release, catalogue_number: nil)
    expect(release).to_not be_valid
	end

end
