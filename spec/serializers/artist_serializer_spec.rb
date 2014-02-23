require 'spec_helper'

describe ArtistSerializer do
  subject { described_class.new(artist) }
  let(:artist) { Fabricate(:artist) }

  it 'has valid root' do
    expect(subject.to_json).to have_json_path('artist')
  end

  [:id, :name, :description, :created_at, :updated_at, :release_ids, :author_id].each do |attr|
    it "includes #{attr}" do
      expect(subject.to_json).to have_json_path("artist/#{attr.to_s}")
    end
  end
 
end
