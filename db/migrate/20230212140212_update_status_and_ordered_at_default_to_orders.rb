class UpdateStatusAndOrderedAtDefaultToOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :status, from: nil, to: 'In progress'
    change_column_default :orders, :ordered_at, from: nil, to: DateTime.now
  end
end
