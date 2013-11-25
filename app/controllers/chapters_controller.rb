class ChaptersController < ApplicationController
	def index
		redirect_to Chapter.all.order( :created_at => :desc ).first
	end
	
	def show
		@chapters = Chapter.all.order( :created_at => :desc )
		@chapter = Chapter.find( params[ :id ] )
		@knowledges = @chapter.knowledges.page( params[ :page ] )
	end
end
