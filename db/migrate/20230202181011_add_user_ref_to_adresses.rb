class AddUserRefToAdresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :adresses, :user, null: true, foreign_key: true
  end
end
