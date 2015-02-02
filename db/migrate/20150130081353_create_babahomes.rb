class CreateBabahomes < ActiveRecord::Migration
  def change
    create_table :babahomes do |t|
      t.string :name
      t.text :intro
      t.string :phone
      t.string :address
      t.integer :country
      t.integer :city
      t.integer :district
      t.text :map_iframe
      t.integer :article_id
      
      t.timestamps
    end
  end
end
