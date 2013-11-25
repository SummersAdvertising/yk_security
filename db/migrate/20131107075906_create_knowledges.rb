class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :title
      t.integer :article_id
      t.string :status
      t.integer :chapter_id

      t.timestamps
    end
  end
end
