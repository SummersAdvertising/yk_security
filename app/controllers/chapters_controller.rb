class ChaptersController < ApplicationController
	def index
		@chapter = Chapter.all.first
		
		
		respond_to do | format |
			if @chapter.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				format.html{ redirect_to @chapter }
			end
		end
	end
	
	def show
		@chapters = Chapter.all
		@chapter = Chapter.find( params[ :id ] )
		@knowledges = @chapter.knowledges.page( params[ :page ] )
	end
end
