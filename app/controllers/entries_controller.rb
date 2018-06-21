class EntriesController < ApplicationController
	def show
		@entry = Entry.find(params[:id])
		@comment = Comment.where(entry_id: @entry.id)
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
