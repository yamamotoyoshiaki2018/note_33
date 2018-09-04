Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#index'
  get 'notes' => 'notes#index'
  # get 'texts' => 'texts#index'
  resources :post_texts, only: [:index, :new, :create]
  resources :users
end
