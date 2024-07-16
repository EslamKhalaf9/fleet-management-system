Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]

      get "/auth", to: "auth#show"
      post "/auth", to: "auth#login"
    end
  end
end
