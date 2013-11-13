Chk::Application.routes.draw do
  devise_for :users
  
  resources :events do
    member do
      get :public_show
      get :public_apply
      get :apply
    end
  end

  get '/auth/:provider/callback', to: 'sessions#auth_callback'

  root :to => "home#index"
end
