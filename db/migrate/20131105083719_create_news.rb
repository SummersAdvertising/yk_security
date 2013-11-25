class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :cover
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
