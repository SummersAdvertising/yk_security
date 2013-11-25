class NoticesController < ApplicationController
	def index
		redirect_to Notice.all.order( :created_at => :desc ).first
	end
	
	def show
		@notices = Notice.all.page( params[ :page ] )
		@notice = Notice.find( params[ :id ] )
		
		@recruit = @notice.recruits.build
		
	end

end