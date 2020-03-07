Rails.application.routes.draw do
  get 'static_pages/about'
  root "static_pages#home"
  devise_for :users

  resources :users
  resources :movies do 
    resources :comments, only: [:index, :new, :create, :destroy]
  end 

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
