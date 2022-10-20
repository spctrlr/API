class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    change_column(:orders, :final_amount, :decimal, precision: 6, scale: 2)
  end
end
