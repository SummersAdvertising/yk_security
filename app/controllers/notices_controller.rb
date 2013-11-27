class NoticesController < ApplicationController
	def index
	
		@notice = Notice.all.order( :created_at => :desc ).first
		
		respond_to do | format |			
			if @notice.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				redirect_to @notice
			end
		end

	end
	
	def show
		@notices = Notice.all.page( params[ :page ] )
		@notice = Notice.find( params[ :id ] )
		
		@recruit = @notice.recruits.build
		
	end

end