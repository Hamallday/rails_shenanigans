Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}

  resources :companies do
    resources :reviews, only: [:new, :create, :show, :destroy]
     
  end 
  
  resources :reviews do
    resources :thanks, only: [:new, :create]
  end

  resources :reviews do
    resources :comments, only: [:new, :create]
  end

  resources :user_companies

  resources :users do 
    resources :user_companies, only: [:show, :new, :create]
  end 

  resources :users do 
    resources :profiles, only: [:show, :new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
