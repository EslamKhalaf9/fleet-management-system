Rails.application.routes.draw do
  resources :users, only: [:create, :index]

  get "/auth", to: "auth#show"
  post "/auth", to: "auth#login"

  get "/seats/:from_station/:to_station", to: "seats#show"

  resources :bookings, only: [:create, :index]
  get "/bookings/all", to: "bookings#all"
end
