class ChangeForeignKeyForOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :vouchers_id, :voucher_id
    rename_column :orders, :products_id, :product_id
  end
end
