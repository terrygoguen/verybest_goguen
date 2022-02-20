Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "dishes#index"
  resources :bookmarks
  resources :users
  resources :neighborhoods
  resources :venues
  resources :cuisines
  resources :dishes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
