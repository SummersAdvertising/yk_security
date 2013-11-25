class NewsController < ApplicationController
	def index
		redirect_to News.all.order( :created_at => :desc )	.first
	end

	def show
		@newses = News.all.order( :created_at => :desc ).page( params[ :page ] ).per(5)
		@news = News.find( params[ :id ] )
		
	end

end
