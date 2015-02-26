class ActorMoviesController < ApplicationController
skip_before_action :verify_authenticity_token
	def add_actor
		movie_id = params[:id]
		actor_id = params[:actor_id]
		ActorMovie.create(actor_id: actor_id, movie_id: movie_id)
		redirect_to movie_path(movie_id)
	end

	def remove_actor
		movie_id = params[:id]
		actor_id = params[:actor_id]
		actormovie = ActorMovie.find_by(actor_id: actor_id, movie_id: movie_id)
		actormovie.destroy
		redirect_to movie_path(movie_id)
	end



end
