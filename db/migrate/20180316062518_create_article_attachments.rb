class CreateArticleAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_attachments do |t|
      t.integer :article_id
      t.string :image

      t.timestamps
    end
  end
end
