class AddViewCountToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :view_count, :integer, default: 0
  end
end
