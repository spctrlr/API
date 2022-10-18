Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post "/login", to: "users#login"
  put "/users/:id", to: "users#update"
  resources :vouchers


  # resources :admin do
  #   resources :users, :vouchers
  # end

end
