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
    @movies = @actor.movies
  end

  def edit
    @actor = Actor.find params[:id]
  end

  def update
  end

  def destroy
    actor = Actor.find params[:id]
    actor.destroy
    redirect_to actors_path
  end

end
  # here is the action to add an actor to an existing movie

  # @movie = Movie.find params[:id]
  # actor = Actor.create actor_params
  # if !@movie.actors.include? actor
    # @movie.actors << actor
  # end