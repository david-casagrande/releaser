require 'spec_helper'

describe Api::ReleasesController do

  describe 'GET :index' do

    it 'populates an array of releases' do
  		releases = [Fabricate(:release), Fabricate(:release)]
    	get :index, format: :json
    	expected = ActiveModel::ArraySerializer.new(releases, root: 'releases')
      expect(response.body).to eq(expected.to_json)
    end

  end

  describe 'GET :show' do
    
    it 'returns the requested release' do
  		release = Fabricate(:release)
    	get :show, id: release, format: :json
    	expected = ReleaseSerializer.new(release)
      expect(response.body).to eq(expected.to_json)
    end
    
  end

end
