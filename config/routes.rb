Rails.application.routes.draw do

  get "beans/current", to: "beans#current", as: :current_beans
  get "beans/cupping", to: "beans#cupping", as: :cupping_beans
  post "beans/:bean_id/rate", to: "beans#rate", as: :rate_bean
  post "beans/:bean_id/toggle_in_stock", to: "beans#toggle_in_stock", as: :bean_toggle_in_stock

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  resources :beans
  resources :roasters
  resources :roast_levels
  resources :origins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "beans#current"

end
