# encoding: utf-8
class Admin::HonoreesController < AdminController

	before_filter :get_honoree

	def edit
		
	end

	def update
		
	    respond_to do |format|
	      if @honoree.update(honoree_params)
	        format.html { redirect_to edit_admin_prise_path(@prise), notice: '人員編輯完成' }
	        format.json { head :no_content }
	      else
	      	flash[ :warning ] += (@honoree.errors.full_messages.join( '<br>' ) ) if !@honoree.nil?
	      	
	        format.html { render action: 'edit' }
	        format.json { render json: @prise.errors, status: :unprocessable_entity }
	      end
	    end
	    
	end

	def destroy
		name = @honoree.name

		@honoree.destroy

		respond_to do | format |
			format.html { redirect_to edit_admin_prise_path( @prise ), notice: "刪除表揚 #{name} 已完成。" }
		end

	end
	
private
	def get_honoree
		@honoree = Honoree.find( params[ :id ] )
		@prise = Prise.find( params[ :prise_id ] )
		
	end	
	
	def honoree_params
		params.require( :honoree ).permit( :name, :cover, :content, :area )
	end
end
