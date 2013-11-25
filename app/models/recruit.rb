class Recruit < ActiveRecord::Base
	belongs_to :notice
	
	
	 def uncheck
	 	self.update_attribute('checked', false)
	 end
	 
	 def check
	 	self.update_attribute('checked', true)
	 end
end
