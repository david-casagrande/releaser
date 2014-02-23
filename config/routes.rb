Releaser::Application.routes.draw do

  devise_for :users, path: 'admin'

  namespace :api do
    resources :artists, :expenses, :releases, except: [:new, :edit]
  end

  root to: 'dashboard#index'

end
