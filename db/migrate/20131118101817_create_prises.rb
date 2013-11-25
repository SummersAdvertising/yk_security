class CreatePrises < ActiveRecord::Migration
  def change
    create_table :prises do |t|
      t.string :title
      t.timestamp :month
      t.string :status

      t.timestamps
    end
  end
end
