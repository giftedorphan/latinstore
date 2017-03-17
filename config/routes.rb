Rails.application.routes.draw do
  resources :categorizes
  resources :categories, param: :category_id, except: [:new, :show, :edit]
  resources :taggings
  resources :tags, param: :tag_id, except: [:new, :show, :edit]
  resources :items, param: :item_id

  root to: "landing#home"
end