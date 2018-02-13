# CreateLinks
class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :description
      t.string :address
      t.references :articles
      t.timestamps
    end
  end
end
