class AddArticleIdToNews < ActiveRecord::Migration
  def change
  	add_column :news, :article_id, :integer
  end
end
