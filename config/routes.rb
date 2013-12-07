Releaser::Application.routes.draw do

  namespace :api do
    resources :artists, :expenses, :releases, except: [:new, :edit]
  end

  root to: 'dashboard#index'

end
