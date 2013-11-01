Chk::Application.routes.draw do
  resources :events do
    member do
      get :apply
    end
  end
  root :to => "home#index"
end
