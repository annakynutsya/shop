class UpdateOrderedAtDefaultToOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :ordered_at, from: nil, to: DateTime.current
  end
end
