class DropCartProductsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :cart_products
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
