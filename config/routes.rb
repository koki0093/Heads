Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'heads#index'
  get 'heads/index' => 'heads#index'

  
  
  resources :snkrs do
    resources :likes, only: [:create, :destroy, :index]
    resources :offers do
      resources :messages, :only => [:create]
      resources :rooms, :only => [:create, :show]
    end
    
  end

  
  resources :rooms, :only => [:index]

  resources :users, only: :show

  resources :notifications, only: :index
  
  
end
