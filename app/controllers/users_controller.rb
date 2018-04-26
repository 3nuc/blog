class UsersController < ApplicationController
	def index
		@user = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		
		@user.save
		redirect_to @user
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
	
	private
		def user_params
			params.require(:user).permit(:login, :password)
		end
		
end
