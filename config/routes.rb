Rails.application.routes.draw do

  post '/login', to: 'users#login'
  
  resources :users, only: [:show, :create, :update, :destroy] do
    resources :vouchers
  end

  resources :brands, only: [:show, :create, :update, :destroy] do
    resources :products
  end

  # resources :admin do
  #   resources :users, :vouchers, :brands, :products
  # end

end
