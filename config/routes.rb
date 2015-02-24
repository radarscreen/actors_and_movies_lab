Rails.application.routes.draw do
  root 'site#index'


  resources :movies

  resources :actors

  resources :site, only: [:index]
  
post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor
post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie


#       Prefix Verb   URI Pattern                Controller#Action
#     movies GET    /movies(.:format)          movies#index
#            POST   /movies(.:format)          movies#create
#  new_movie GET    /movies/new(.:format)      movies#new
# edit_movie GET    /movies/:id/edit(.:format) movies#edit
#      movie GET    /movies/:id(.:format)      movies#show
#            PATCH  /movies/:id(.:format)      movies#update
#            PUT    /movies/:id(.:format)      movies#update
#            DELETE /movies/:id(.:format)      movies#destroy
#     actors GET    /actors(.:format)          actors#index
#            POST   /actors(.:format)          actors#create
#  new_actor GET    /actors/new(.:format)      actors#new
# edit_actor GET    /actors/:id/edit(.:format) actors#edit
#      actor GET    /actors/:id(.:format)      actors#show
#            PATCH  /actors/:id(.:format)      actors#update
#            PUT    /actors/:id(.:format)      actors#update
#            DELETE /actors/:id(.:format)      actors#destroy
# site_index GET    /site(.:format)            site#index
end
