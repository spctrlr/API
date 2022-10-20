Rails.application.routes.draw do

  post '/login', to: 'users#login'
  
  resources :users do
    resources :vouchers
  end

  resources :brands  

  # resources :admin do
  #   resources :users, :vouchers, :brands
  # end

end
