Rails.application.routes.draw do
  get 'static_pages/about'
  root "movies#index"
  resources :movies do 
    resources :comments, only: [:index, :new, :create, :destroy]
  end 

  devise_for :users

  resources :users

 

# post "movies/:id/comments/new", to: 'movie#new_comment', as: 'new_movie_comment'
  # get 'new_movie_comment/:id', to: 'movie#new_comment', as: 'new_movie_comment'
	# post 'add_movie_comment/:id/:comment_id', to: 'movies#add_comment', as: 'add_movie_comment'
  # delete 'remove_movie_comment/:id/:comment_id', to: 'movies#remove_comments', as: 'remove_movie_comment'

  #theater = movie
  #movie = comment
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
