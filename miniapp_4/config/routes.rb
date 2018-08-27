Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'blogs#index'
  resources :blogs
  resources :users, only: [:show, :create]

end
