class AddFbMetaDescriptionColumn < ActiveRecord::Migration
  def change
    add_column :news, :fb_meta_description, :text
  end
end
