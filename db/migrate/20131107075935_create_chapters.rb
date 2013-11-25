class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :status
      t.integer :sort

      t.timestamps
    end
  end
end
