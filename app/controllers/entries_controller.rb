class EntriesController < ApplicationController

	before_action :protectnew, :only => [:new]
	before_action :protectcreate, :only => [:create]
	
	def index
		@entry = if params[:term]
			Entry.where('title LIKE ?', "%#{params[:term]}%")
		else
			Entry.all
		end

	def show
		@entry = Entry.find(params[:id])
		@comment = Comment.where(entry_id: @entry.id)

	end
	
	def new
		@entry = Entry.new
		@blog_id = params[:blogbase_id]
	end
	
	def create
		@entry = Entry.new(entry_params)
		
		@entry.save
		redirect_to Blogbase.find(params[:entry][:blogbase_id])
	end
	
	def protectnew
		redirect_to root_path unless current_user && (current_user.id == Blogbase.find(params[:blogbase_id]).user_id)
	end
	
	def protectcreate
		redirect_to root_path unless current_user && (current_user.id == Blogbase.find(params[:entry][:blogbase_id]).user_id)
	end
	
	private
		def entry_params
			params.require(:entry).permit(:title, :text, :blogbase_id)
		end
end
