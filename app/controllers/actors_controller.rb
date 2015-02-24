class ActorsController < ApplicationController
  def index
  	@actors = Actor.all
  end

  def create
    form_data = params.require(:actor).permit(:name)
    Actor.create form_data
    redirect_to actors_path
  end

  def new
    @actor = Actor.new
  end

  def show
    @actor = Actor.find params[:id]
    @moviesin = @actor.movies
    @movies = Movie.all
    @moviesremain = @movies - @actor.movies
  end

  def edit
    @actor = Actor.find params[:id]
    @actor_movies = @actor.movies.all
  end

  def update
    form_data = params.require(:actor).permit(:name)
    actor = Actor.find params[:id]
    actor.update_attributes form_data
    redirect_to actor_path(actor)
  end

  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to actors_path
  end

  def add_movie
    @actor = Actor.find params[:id]
    movie = Movie.find params [:id]
    @actor.movies << movie  #movies is the name of the column in the table?
    redirect_to actors_path(@actor)
    #do you need to pass in a parameter to the actors_path(actor)?
  end

  def remove_movie
    @actor = Actor.find params[:id]
    movie = Movie.find params[:id]  #does this need to have [:movie_id]
    actor.movies.destroy(movie) 
    redirect_to actors_path(@actor)
  end

end
  # here is the action to add an actor to an existing movie

  # @movie = Movie.find params[:id]
  # actor = Actor.create actor_params
  # if !@movie.actors.include? actor
    # @movie.actors << actor
  # end