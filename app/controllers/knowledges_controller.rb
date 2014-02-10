class KnowledgesController < ApplicationController
	def show
		@knowledge = Knowledge.find( params[ :id ] )
		@chapter = Chapter.find( params[ :chapter_id ] )
		@chapters = Chapter.all
	end
end
