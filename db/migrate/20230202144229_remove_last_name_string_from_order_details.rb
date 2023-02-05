class RemoveLastNameStringFromOrderDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :last_name_string, :string
  end
end
