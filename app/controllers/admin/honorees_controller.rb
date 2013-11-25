# encoding: utf-8
class Admin::HonoreesController < AdminController
	def destroy
		@honoree = Honoree.find( params[ :id ] )
		name = @honoree.name
		@prise = Prise.find( params[ :prise_id ] )

		@honoree.destroy

		respond_to do | format |
			format.html { redirect_to edit_admin_prise_path( @prise ), notice: '刪除表揚 #{name} 已完成。' }
		end

	end
end
