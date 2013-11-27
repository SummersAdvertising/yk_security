class NewsController < ApplicationController
	def index
		@news = News.all.order( :created_at => :desc ).first
		
			if @news.nil?
				render :template => 'layouts/empty'
			else
				redirect_to @news
			end
	end

	def show
		@newses = News.all.order( :created_at => :desc ).page( params[ :page ] ).per(5)
		@news = News.find( params[ :id ] )
		
	end

end
