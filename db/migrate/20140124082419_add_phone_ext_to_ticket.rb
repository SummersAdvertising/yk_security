class AddPhoneExtToTicket < ActiveRecord::Migration
  def change
  	add_column :tickets, :phone_ext, :string
  	add_column :tickets, :phone_area, :string
  end
end
