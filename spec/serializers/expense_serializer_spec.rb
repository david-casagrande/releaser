require 'spec_helper'

describe ExpenseSerializer do
  subject { described_class.new(expense) }

  let(:expense) { Fabricate(:expense) }

  it 'has valid root' do
    expect(subject.to_json).to have_json_path('expense')
  end

  [:id, :description, :cost, :release_id, :created_at, :updated_at].each do |attr|
    it "includes #{attr}" do
      expect(subject.to_json).to have_json_path("expense/#{attr.to_s}")
    end
  end
 
end
