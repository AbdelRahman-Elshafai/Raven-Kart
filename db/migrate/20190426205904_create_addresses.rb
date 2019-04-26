class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :building
      t.string :street
      t.string :district
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
