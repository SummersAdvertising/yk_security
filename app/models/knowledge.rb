class Knowledge < ActiveRecord::Base
	belongs_to :article, :dependent => :destroy
	belongs_to :chapter
	
	paginates_per 20 
	
	validates_presence_of :title

	default_scope order( 'created_at DESC' )
	
end
