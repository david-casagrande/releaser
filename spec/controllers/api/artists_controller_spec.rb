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
    
    it 'returns the requested artist' do
  		artist = Fabricate(:artist)
    	get :show, id: artist, format: :json
    	expected = ArtistSerializer.new(artist)
      expect(response.body).to eq(expected.to_json)
    end
    
  end

  describe 'POST :create' do

    it 'creates a new artist' do
      expect{ 
        post :create, artist: Fabricate.attributes_for(:artist), format: :json
      }.to change(Artist, :count).by(1)
    end

  end

  describe 'PUT :update' do

    it 'updates an artist' do
      artist = Fabricate(:artist)
      put :update, id: artist, artist: Fabricate.attributes_for(:artist, name: 'Dan Casey'), format: :json
      artist.reload
      expect(artist.name).to eq('Dan Casey')
    end

  end

  describe 'DELETE :destroy' do

    it 'deletes an artist' do
      artist = Fabricate(:artist)
      expect do
        delete :destroy, id: artist.id, format: :json
      end.to change(Artist, :count).by(-1)
    end

    it 'deletes associated releases' do
      artist = Fabricate(:artist)
      release = Fabricate(:release, { artist: artist })
      expect do
        delete :destroy, id: artist.id, format: :json
      end.to change(Release, :count).by(-1)
    end

  end

end
