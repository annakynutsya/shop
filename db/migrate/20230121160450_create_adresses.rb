class CreateAdresses < ActiveRecord::Migration[7.0]
  def change
    create_table :adresses do |t|
      t.string :country
      t.string :city
      t.string :street
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
