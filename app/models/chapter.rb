class Chapter < ActiveRecord::Base

	has_many :knowledges

	paginates_per 20
	
	validates_presence_of :title
	
	default_scope order( 'sort ASC, created_at DESC' )
	
end
