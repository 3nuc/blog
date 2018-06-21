class CommentsController < ApplicationController
	
	def create
		@comment = Comment.new(comment_params)
		
		@comment.save
		redirect_to Entry.find(params[:comment][:entry_id])
	end
	
	private
		def comment_params
			params.require(:comment).permit(:poster_name, :content, :entry_id)
		end
end
