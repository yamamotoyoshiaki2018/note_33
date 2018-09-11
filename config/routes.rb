Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_texts#index'
  resources :notes, only: [:index]
  resources :post_texts, only: [:index, :new, :create, :destroy, :show, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    member do
      get 'profile', :followings, :followers
    end
  end
  resources :follows, only: [:create, :destroy]
end
