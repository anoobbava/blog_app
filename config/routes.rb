# encoding: utf-8

Rails.application.routes.draw do

  devise_for :users

  root to: 'articles#index'

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :articles do
    member do
      put "like" =>"articles#like"
    end
    resources :comments, only: %i[create destroy]
  end

  resources :categories
end
