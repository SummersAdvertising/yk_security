class NewsController < ApplicationController
	def index
		@news = News.all.order( :created_at => :desc ).first
		
		respond_to do | format |			
			if @news.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				redirect_to @news
			end
		end
	end

	def show
		@newses = News.all.order( :created_at => :desc ).page( params[ :page ] ).per(5)
		@news = News.find( params[ :id ] )
		
	end

end
