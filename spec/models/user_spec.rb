require 'spec_helper'

describe User do
  it 'has a valid Fabricator' do
		expect(Fabricate(:user)).to be_valid
	end
end
