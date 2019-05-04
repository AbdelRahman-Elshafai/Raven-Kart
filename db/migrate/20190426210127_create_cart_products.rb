class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :quantity, null: false
      t.references :product, foreign_key: true, null: false
      t.references :shopping_cart , foreign_key: true, null: false

      t.timestamps
    end
  end
end
