class ChaptersController < ApplicationController
	def index
		@chapter = Chapter.all.order( :created_at => :desc ).first
		
		respond_to do | format |			
			if @chapter.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				redirect_to @chapter
			end
		end
		
	end
	
	def show
		@chapters = Chapter.all.order( :created_at => :desc )
		@chapter = Chapter.find( params[ :id ] )
		@knowledges = @chapter.knowledges.page( params[ :page ] )
	end
end
