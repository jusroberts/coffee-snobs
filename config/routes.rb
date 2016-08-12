Rails.application.routes.draw do
  devise_for :users
  resources :beans
  resources :roaster
  resources :roast_level
  resources :origin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
