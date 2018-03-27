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

  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"
end
