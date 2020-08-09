Rails.application.routes.draw do
  namespace :api do
    api_actions = [:index, :show, :create, :update, :destroy]

    concern :commentable do
      resources :comments, only: [:index, :create, :update, :destroy]
    end

    resources :articles, only: api_actions, concerns: [:commentable]
    resources :locations, only: api_actions do
      resources :articles, only: [:index]
    end
    resources :users, only: api_actions
    resources :videos, only: api_actions, concerns: [:commentable]
  end

  resource :session, only: [:show, :create, :destroy]
end
