class RemoveUserIdFromAdresses2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :adresses, :user_id, :bigint
  end
end
