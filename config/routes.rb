Releaser::Application.routes.draw do

  namespace :api do
    resources :artists, only: [:index, :show]
    resources :expenses, only: [:index, :show]
    resources :releases, only: [:index, :show]
  end

  root to: 'dashboard#index'

end
