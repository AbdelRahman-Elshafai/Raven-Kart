class SetTotalPriceToNull < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :total_price, :integer, :null => true
  end
end
