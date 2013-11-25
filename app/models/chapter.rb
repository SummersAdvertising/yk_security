class Chapter < ActiveRecord::Base

	has_many :knowledges

	paginates_per 20
	
	validates_presence_of :title
	
	
end
