class StaticPagesController < ApplicationController
	def index
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
