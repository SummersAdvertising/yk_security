class Instruction < ActiveRecord::Base
	belongs_to :article, :dependent => :destroy
	
	validates_presence_of :title
		
	paginates_per 20
end
