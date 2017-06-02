Rails.application.routes.draw do

  # root to: "main#index"

  namespace :api do
    namespace :v1 do

      root to: "main#index"
      devise_for :users, controllers: { registrations: "api/v1/registrations" }

    end
  end

end
