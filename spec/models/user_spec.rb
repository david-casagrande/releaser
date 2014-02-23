require 'spec_helper'

describe User do
  it 'has a valid Fabricator' do
		expect(Fabricate(:user)).to be_valid
	end

  it 'has many artists' do
    expect(Fabricate(:user)).to respond_to(:artists)
  end	

  it 'has many releases' do
    expect(Fabricate(:user)).to respond_to(:releases)
  end	

  it 'has many expenses' do
    expect(Fabricate(:user)).to respond_to(:expenses)
  end	

end
