class DropCategoryIdFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :category_id
  end
end
