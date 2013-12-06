require 'spec_helper'

describe Expense do
	
	it 'has a valid Fabricator' do
		expect(Fabricate(:expense)).to be_valid
	end

  it 'belongs to a release' do
    expect(Fabricate(:expense).release).to be_a Release
  end

end
