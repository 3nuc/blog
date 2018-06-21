class EntriesController < ApplicationController
	
	def index
		@entry = if params[:term]
			Entry.where('title LIKE ?', "%#{params[:term]}%")
		else
			Entry.all
		end
	end
	
	def new
		@entry = Entry.new
		@blog_id = params[:blog_id]
	end
	
	def create
		@entry = Entry.new(entry_params)
		
		@entry.save
		redirect_to Blogbase.find(params[:entry][:blogbase_id])
	end
	
	private
		def entry_params
			params.require(:entry).permit(:title, :text, :blogbase_id)
		end
end
