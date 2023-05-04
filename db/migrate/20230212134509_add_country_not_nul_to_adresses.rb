class AddCountryNotNulToAdresses < ActiveRecord::Migration[7.0]
  def change
    change_column_null :adresses, :country, false
    change_column_null :adresses, :city, false
    change_column_null :adresses, :street, false
  end
end
