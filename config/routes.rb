Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :users
  resources :friendships
  resources :friend_requests
  resources :posts,          only: [:create, :destroy]
  get '/help', to: 'static_pages#help'
  get '/index', to:'static_pages#index'
  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy" 
  end
end
