class RemoveImageUrlFromCats < ActiveRecord::Migration
  def change
    remove_column :cats, :image_url, :text
  end
end
