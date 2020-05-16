Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'tweets#top'
  resources :tweets do
    get 'top', to: 'tweets#top'
  end
  resources :users, only: [:show, :index] do
    
    member do
      get :following, :followers
    end
  end  
  resources :relationships,only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
