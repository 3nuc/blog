class BlogbasesController < ApplicationController
	before_action :protectnew, :only => [:new]
	before_action :protectcreate, :only => [:create]

	def index
		@blog = Blogbase.all
	end
	
	def show
		@blog = Blogbase.find(params[:id])
		@entry = Entry.where(blogbase_id: @blog.id)
	end
	
	def new
		@blog = Blogbase.new
		@user_id = params[:user_id]
	end
	
	def create
		@blog = Blogbase.new(blog_params)
		
		@blog.save
		redirect_to User.find(params[:blogbase][:user_id])
	end
	
	def protectnew
		redirect_to root_path unless current_user && (current_user.id.to_s == params[:user_id])
	end
	def protectcreate
		redirect_to root_path unless current_user && (current_user.id.to_s == params[:blogbase][:user_id])
	end
	
	private
		def blog_params
			params.require(:blogbase).permit(:name, :user_id)
		end
end
