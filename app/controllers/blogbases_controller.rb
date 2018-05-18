class BlogbasesController < ApplicationController
	def index
		@blogs = Blogbase.all
	end
	
	def new
		@blog = Blogbase.new
		@kurla = @user_id
	end
	
	def create
		@blog = Blogbase.new(blog_params)
		
		@blog.save
		redirect_to User.find(:user_id)
	end
	
	private
		def blog_params
			params.require(:blog).permit(:name, :user_id)
		end
end
