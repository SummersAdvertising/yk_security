class News < ActiveRecord::Base
  include ParsePeditor
	mount_uploader :cover, NewsUploader
	
	belongs_to :article, :dependent => :destroy
	
	
	validates_presence_of :title, :fb_meta_description
	
	paginates_per 20 
	
end
