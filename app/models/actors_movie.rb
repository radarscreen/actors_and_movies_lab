class ActorsMovie < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
# belongs_to :commentable, :polymorphic => true
  validates :actor_id, uniqueness: {scope: :movie_id}
end
