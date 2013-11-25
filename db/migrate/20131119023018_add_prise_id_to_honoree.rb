class AddPriseIdToHonoree < ActiveRecord::Migration
  def change
  	add_column :honorees, :prise_id, :integer
  end
end
