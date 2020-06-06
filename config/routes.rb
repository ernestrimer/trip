Rails.application.routes.draw do
root 'travels#index'

resources :travels do
  resources :locations
end

resources :locations do
  resources :addresses
  end
end