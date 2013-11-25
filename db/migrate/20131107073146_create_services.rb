class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :cover
      t.text :items
      t.integer :article_id
      t.string :status
      t.string :external_link

      t.timestamps
    end
  end
end
