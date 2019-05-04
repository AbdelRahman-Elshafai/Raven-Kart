class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.text :summary, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
