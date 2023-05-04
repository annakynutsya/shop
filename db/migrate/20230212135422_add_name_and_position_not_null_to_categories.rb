class AddNameAndPositionNotNullToCategories < ActiveRecord::Migration[7.0]
  def change
    change_column_null :categories, :name, false
    change_column_null :categories, :position, false
  end
end
