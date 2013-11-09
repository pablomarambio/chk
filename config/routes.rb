Chk::Application.routes.draw do
  devise_for :users
  resources :events do
    member do
      get :apply
    end
  end

  get '/auth/:provider/callback', to: 'sessions#auth_callback'

  root :to => "home#index"
end
