class News < ActiveRecord::Base
  include PeditorParser
	mount_uploader :cover, NewsUploader
	
	belongs_to :article, :dependent => :destroy
	
	
	validates_presence_of :title, :fb_meta_description
	
	paginates_per 20 
	
end
