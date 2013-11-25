class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :company
      t.text :phone
      t.string :mobile
      t.string :address
      t.string :email
      t.text :services
      t.string :status

      t.timestamps
    end
  end
end
