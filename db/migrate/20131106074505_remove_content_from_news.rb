class RemoveContentFromNews < ActiveRecord::Migration
  def change
  	remove_column :news, :content
  end
end
