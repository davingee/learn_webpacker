Rails.application.routes.draw do

  resources :bid_managements
  resources :companies do 
    resources :users 
    resources :projects do 
      resources :accounts
    end
  end

  root to: "main#index"
  devise_for :users

  namespace :api do
    namespace :v1 do

      root to: "main#index"
      devise_for :users, controllers: { registrations: "api/v1/registrations" }

    end
  end

end
