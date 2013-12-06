require 'spec_helper'

describe ReleaseSerializer do
  subject { described_class.new(release) }

  let(:release) { Fabricate(:release) }

  it 'has valid root' do
    expect(subject.to_json).to have_json_path('release')
  end

  [:id, :artist_id, :catalogue_number, :expense_ids, :name, :created_at, :updated_at].each do |attr|
    it "includes #{attr}" do
      expect(subject.to_json).to have_json_path("release/#{attr.to_s}")
    end
  end
 
end
