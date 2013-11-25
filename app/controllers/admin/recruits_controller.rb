class Admin::RecruitsController < AdminController
	def show
		@recruit = Recruit.find( params[ :id ] )
		@notice = Notice.find( params[ :notice_id ] )
		
		@recruit.check
	end

end
