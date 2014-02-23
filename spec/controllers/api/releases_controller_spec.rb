require 'spec_helper'

describe API::ReleasesController do
  let!(:user) { Fabricate(:user) }  
  let!(:release) { Fabricate(:release) }

  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe 'GET :index' do
    let!(:release2) { Fabricate(:release) }

    it 'populates an array of releases' do
    	get :index, format: :json
    	expected = ActiveModel::ArraySerializer.new([release, release2], root: 'releases')
      expect(response.body).to eq(expected.to_json)
    end

  end

  describe 'GET :show' do
    
    it 'returns the requested release' do
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
      put :update, id: release, release: Fabricate.attributes_for(:release, name: 'Test'), format: :json
      release.reload
      expect(release.name).to eq('Test')
    end

  end

  describe 'DELETE :destroy' do
    
    it 'deletes a release' do
      expect do
        delete :destroy, id: release.id, format: :json
      end.to change(Release, :count).by(-1)
    end
  
    it 'deletes associated expenses' do
      expense = Fabricate(:expense, { release: release })
      expect do
        delete :destroy, id: release.id, format: :json
      end.to change(Expense, :count).by(-1)
    end

  end

end
