class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image
      t.integer :price, null: false
      t.integer :stock, null: false
      t.references :store, foreign_key: true, null: false
      t.references :brand, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
