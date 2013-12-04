require 'spec_helper'

describe Api::ArtistsController do

  describe 'GET :index' do

    it 'populates an array of artists' do
  		artists = [Fabricate(:artist), Fabricate(:artist)]
    	get :index, format: :json
    	expected = ActiveModel::ArraySerializer.new(artists, root: 'artists')
      expect(response.body).to eq(expected.to_json)
    end

  end

  describe 'GET :show' do
    
    it 'returns the requested release' do
  		artist = Fabricate(:artist)
    	get :show, id: artist, format: :json
    	expected = ArtistSerializer.new(artist)
      expect(response.body).to eq(expected.to_json)
    end
    
  end

end
