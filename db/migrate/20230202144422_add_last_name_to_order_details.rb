class AddLastNameToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :last_name, :string
  end
end
