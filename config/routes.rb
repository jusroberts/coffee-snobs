Rails.application.routes.draw do

  get "beans/current", to: "beans#current", as: :current_beans
  post "beans/:bean_id/rate", to: "beans#rate", as: :rate_bean

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :beans
  resources :roasters
  resources :roast_levels
  resources :origins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "beans#current"

end
