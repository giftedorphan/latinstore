Rails.application.routes.draw do
  resources :categorizes
  resources :categories
  resources :taggings
  resources :tags
  resources :items

  root to: "landing#home"
end