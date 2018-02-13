# rename the articles_id in links to article_id to work on association
class RenameArticleColumnToLink < ActiveRecord::Migration[5.1]
  def change
    rename_column :links, :articles_id, :article_id
  end
end
