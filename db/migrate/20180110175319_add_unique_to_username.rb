class AddUniqueToUsername < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :user_name, :string, unique: :true
  end
end
