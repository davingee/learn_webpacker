Rails.application.routes.draw do

  root to: "main#index"

  namespace :api do
    namespace :v1 do

      devise_for :users
      root to: "main#index"

    end
  end

end
