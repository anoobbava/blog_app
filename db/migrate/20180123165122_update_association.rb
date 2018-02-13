# UpdateAssociation
class UpdateAssociation < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :user, foriegn_key: true
    add_reference :links, :user, foriegn_key: true
  end
end
