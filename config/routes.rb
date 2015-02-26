Rails.application.routes.draw do

  resources :movies do
  	post '/comments', to: 'comments#create', as: 'comments'
  end

  resources :actors do
  	post '/comments', to: 'comments#create', as: 'comments'
  end


  resources :comments

  post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie

  root 'site#index'

#    Prefix Verb   URI Pattern                            Controller#Action
#       movies GET    /movies(.:format)                      movies#index
#              POST   /movies(.:format)                      movies#create
#    new_movie GET    /movies/new(.:format)                  movies#new
#   edit_movie GET    /movies/:id/edit(.:format)             movies#edit
#        movie GET    /movies/:id(.:format)                  movies#show
#              PATCH  /movies/:id(.:format)                  movies#update
#              PUT    /movies/:id(.:format)                  movies#update
#              DELETE /movies/:id(.:format)                  movies#destroy
#       actors GET    /actors(.:format)                      actors#index
#              POST   /actors(.:format)                      actors#create
#    new_actor GET    /actors/new(.:format)                  actors#new
#   edit_actor GET    /actors/:id/edit(.:format)             actors#edit
#        actor GET    /actors/:id(.:format)                  actors#show
#              PATCH  /actors/:id(.:format)                  actors#update
#              PUT    /actors/:id(.:format)                  actors#update
#              DELETE /actors/:id(.:format)                  actors#destroy
#     comments GET    /comments(.:format)                    comments#index
#              POST   /comments(.:format)                    comments#create
#  new_comment GET    /comments/new(.:format)                comments#new
# edit_comment GET    /comments/:id/edit(.:format)           comments#edit
#      comment GET    /comments/:id(.:format)                comments#show
#              PATCH  /comments/:id(.:format)                comments#update
#              PUT    /comments/:id(.:format)                comments#update
#              DELETE /comments/:id(.:format)                comments#destroy
#    add_actor POST   /movies/:id/actors/new(.:format)       movies#add_actor
# remove_actor DELETE /movies/:id/actors/:actor_id(.:format) movies#remove_actor
#    add_movie POST   /actors/:id/movies/new(.:format)       actors#add_movie
# remove_movie DELETE /actors/:id/movies/:movie_id(.:format) actors#remove_movie
#         root GET    /                                      site#index
end
