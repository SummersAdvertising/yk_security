class News < ActiveRecord::Base

	mount_uploader :cover, NewsUploader
	
	belongs_to :article, :dependent => :destroy
	
	
	validates_presence_of :title
	
	paginates_per 20 
	
end
