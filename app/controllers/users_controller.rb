class UsersController < ApplicationController
	before_action :off, :only => [:destroy]
	before_action :protect, :only => [:edit, :update]

	def index
		@user = User.all
	end
	
	def show
		@user = User.find(params[:id])
		@blog = Blogbase.where(user_id: @user.id)
	end

	def new
		@user = User.new
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		
		if @user.save
			redirect_to root_url, :notice => "Signed up!"
		else
			render "new"
		end
	end
	
	def update
		@user = User.find(params[:id])
		
		@user.update(user_params)
		redirect_to @user
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		redirect_to users_path
	end
	
	def off
		redirect_to root_path
	end
	
	def protect
		redirect_to root_path unless current_user && (current_user.id.to_s == params[:id])
	end
	
	private
		def user_params
			params.require(:user).permit(:login, :unhashed_pass)
		end
		
end
