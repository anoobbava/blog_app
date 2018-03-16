class DropImageFromArticle < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :image
  end
end
