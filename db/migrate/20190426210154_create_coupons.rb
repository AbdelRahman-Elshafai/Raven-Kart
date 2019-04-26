class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.date :expiration_date
      t.integer :usage_limit
      t.string :deduction_type
      t.integer :deduction_amount

      t.timestamps
    end
  end
end
