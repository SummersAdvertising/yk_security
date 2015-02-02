class CreateIntroPages < ActiveRecord::Migration
  def change
    create_table :intro_pages do |t|
      t.string :title
      t.string :page_name
      t.integer :article_id

      t.timestamps
    end
  end
end
