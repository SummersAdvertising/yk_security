class ServicesController < ApplicationController
	def index
		
	  	@regular_services = Service.where( 'service_type <> "external"' ).order( :updated_at => :desc )
	  	@external_services = Service.where( :service_type => 'external' ).order( :updated_at => :desc )
		
	end
	
	def show
		@service = Service.find( params[ :id ] )
		
		if @service.service_type == 'external'
			redirect_to @service.external_link
		end
		
		
	end
end
