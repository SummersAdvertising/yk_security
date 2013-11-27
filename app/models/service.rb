class Service < ActiveRecord::Base
	serialize :items, Array

	mount_uploader :cover, ServiceUploader
	
	belongs_to :article, :dependent => :destroy
	
	accepts_nested_attributes_for :article
	
	validates_presence_of :title
	
	before_save :defaults
	
private
	def defaults
		self.service_type ||= 'regular'
	end
	
end
