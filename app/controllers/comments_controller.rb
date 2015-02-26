class CommentsController < ApplicationController

	def show
		@commentable = find_commentable
		@comments = @commentable.comments
	end


	def create
  @commentable = find_commentable
  @comment = @commentable.comments.build comment_params
  	if @comment.save
    flash[:notice] = "Successfully saved comment."
    redirect_to :back
  	end
	end

private
	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_commentable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end

end
