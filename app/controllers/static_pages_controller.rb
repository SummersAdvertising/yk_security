class StaticPagesController < ApplicationController
	def index
	
		@news = News.order( :created_at => :desc ).limit( 5 )
	
		respond_to do | format |
			format.html { render layout: nil }
		end
	end
	
	def show
		
		if params[ :page ].nil?
			redirect_to :index
		end
		
		respond_to do | format |
			format.html { render :template => 'static_pages/' + params[ :page ] }
		end
		
	end

end
