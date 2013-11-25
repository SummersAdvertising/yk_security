class KnowledgesController < ApplicationController
	def show
		@knowledge = Knowledge.find( params[ :id ] )
		@chapter = Chapter.find( params[ :chapter_id ] )
		@chapters = Chapter.all.order( :created_at => :desc )
	end
end
