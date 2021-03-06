Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :commentable do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end


  root 'notes#index'
  resources :notes, only: [:index]
  resources :post_texts, only: [:index, :new, :create, :destroy, :show, :edit, :update], concerns: :commentable
  #  do
  #   resources :comments,
  # end

  resources :post_images, only: [:index, :new, :create, :destroy, :show, :edit, :update], concerns: :commentable

  resources :users do
    member do
      get 'profile', 'magazines'
      get :followings, :followers
    end
  end
  resources :follows, only: [:create, :destroy]

  get 'tags/:tag', to: 'post_texts#index', as: :tag
  resources :post_images, :post_texts
  root to: 'post_texts#index'

  # get 'tags/:tag', to: 'post_images#index', as: :tag
  # resources :post_images
  # root to: 'post_images#index'

  resources :magazines, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end



