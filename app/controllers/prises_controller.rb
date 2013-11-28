class PrisesController < ApplicationController

	before_filter :get_years
	
	def index
		if params[ :year ].nil?
			@prise = Prise.all.order( :month => :desc ).first
		else
			@prise = Prise.all.order( :month => :desc ).group_by{ | p | p.month.strftime('%Y') }[ params[ :year ] ].first
		end
			
		respond_to do | format |
			if @prise.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				format.html{ redirect_to prise_path(@prise, :year => params[ :year ]) }
			end
		end
		
	end
	
	def show
	
		if params[ :year ].nil?
			@prises = Prise.all.order( :month => :desc ).page( params[ :page ] ).per(5)
		else
			@prises = Kaminari.paginate_array( Prise.all.order( :month => :desc ).group_by{ | p | p.month.strftime('%Y') }[ params[ :year ] ] ).page( params[ :page ] ).per(5)
		end
		
		@prise = Prise.find( params[ :id ] )		
	end


private	
	def get_years
	
		@years = []
		
		Prise.pluck( :month ).each do | y |
			@years.push( y.strftime( '%Y' ) )
		end
		
		@years = @years.uniq
	
	end

end
