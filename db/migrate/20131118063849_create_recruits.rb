class CreateRecruits < ActiveRecord::Migration
  def change
    create_table :recruits do |t|
      t.string :name
      t.integer :notice_id
      t.string :sex
      t.string :birthday
      t.string :phone
      t.string :address
      t.string :email
      t.string :educated
      t.string :experience
      t.text :brief
      t.string :status
      t.boolean :checked

      t.timestamps
    end
  end
end
