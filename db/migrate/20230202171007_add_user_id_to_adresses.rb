class AddUserIdToAdresses < ActiveRecord::Migration[7.0]
  def change
    add_column :adresses, :user_id, :bigint, null: true
  end
end
