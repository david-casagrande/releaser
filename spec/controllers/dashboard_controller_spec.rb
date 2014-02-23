require 'spec_helper'

describe DashboardController do
  let!(:user) { Fabricate(:user) }

  before do
		sign_in user
  end

  after do
		sign_out user
  end

  describe 'GET :index' do

    it 'renders the :index view' do 
      get :index
      expect(response).to render_template :index
    end
  
  end

end
