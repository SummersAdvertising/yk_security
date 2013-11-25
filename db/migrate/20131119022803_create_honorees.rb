class CreateHonorees < ActiveRecord::Migration
  def change
    create_table :honorees do |t|
      t.string :name
      t.string :area
      t.text :content
      t.string :cover

      t.timestamps
    end
  end
end
