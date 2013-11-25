class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.string :title
      t.integer :article_id
      t.string :status

      t.timestamps
    end
  end
end
