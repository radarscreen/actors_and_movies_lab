class SiteController < ApplicationController
  def index
  	@movies = Movie.all
  	@actors = Actor.all
  end
end
