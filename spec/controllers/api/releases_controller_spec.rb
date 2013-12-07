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

  describe 'POST :create' do

    it 'creates a new release' do
      expect{ 
        post :create, release: Fabricate.attributes_for(:release), format: :json
      }.to change(Release, :count).by(1)
    end

  end

  describe 'PUT :update' do

    it 'updates a release' do
      release = Fabricate(:release)
      put :update, id: release, release: Fabricate.attributes_for(:release, name: 'Test'), format: :json
      release.reload
      expect(release.name).to eq('Test')
    end

  end

  describe 'DELETE :destroy' do
    
    it 'deletes a release' do
      release = Fabricate(:release)
      expect do
        delete :destroy, id: release.id, format: :json
      end.to change(Release, :count).by(-1)
    end
  
    it 'deletes associated expenses' do
      release = Fabricate(:release)
      expense = Fabricate(:expense, { release: release })
      expect do
        delete :destroy, id: release.id, format: :json
      end.to change(Expense, :count).by(-1)
    end

  end

end
