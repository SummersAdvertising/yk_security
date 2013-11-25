class PrisesController < ApplicationController

	before_filter :get_years
	
	def index
		if params[ :year ].nil?
			redirect_to Prise.all.order( :month => :desc ).first
		else
			redirect_to prise_path(Prise.all.order( :month => :desc ).group_by{ | p | p.month.strftime('%Y') }[ params[ :year ] ].first, :year => params[ :year ])
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
