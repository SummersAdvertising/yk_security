class InstructionsController < ApplicationController
	
	before_filter :get_years

	def index
		
		if params[ :year ].nil?
			@instruction = Instruction.all.order( :created_at => :desc ).first
		else
			@instruction = Instruction.all.order( :created_at => :desc ).group_by{ | p | p.created_at.strftime('%Y') }[ params[ :year ] ].first
		end
				
		respond_to do | format |
			if @instruction.nil?
				format.html{ render :template => 'layouts/empty' }
			else
				format.html{ redirect_to instruction_path(@instruction, :year => params[ :year ]) }
			end
		end
	end
	
	def show
	
		if params[ :year ].nil?
			@instructions = Instruction.all.order( :created_at => :desc ).page( params[ :page ] ).per(5)
		else
			@instructions = Kaminari.paginate_array(Instruction.all.order( :created_at => :desc ).group_by{ | t | t.created_at.strftime('%Y') }[ params[ :year ] ]).page( params[ :page ] ).per(5)
		end
		
		@instruction = Instruction.find( params[ :id ] )
		
	end
	
	def year
		
		@instruction = @instructions.first
	
		respond_to do | format |
			format.html { render :template => 'instructions/show' }
		end
		
	end
	
private	
	def get_years
	
		@years = []
		
		Instruction.pluck( :created_at ).each do | y |
			@years.push( y.strftime( '%Y' ) )
		end
		
		@years = @years.uniq
	
	end
	
end
