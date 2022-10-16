Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post "/login", to: "users#login"
  put "users/:id", to: "users#edit"

  # resources :admin do
  #   resources :users
  # end

end
