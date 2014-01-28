class ServicesController < ApplicationController
	def index
		@services = Service.all.order( :updated_at => :desc )
	end
	
	def show
		@service = Service.find( params[ :id ] )
		
		if @service.service_type == 'external'
			redirect_to @service.external_link
		end
		
		
	end
end
