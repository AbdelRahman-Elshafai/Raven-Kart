class AddTotaPriceToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :total_price, :decimal
  end
end
