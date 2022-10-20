class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :final_amount, null: false
      t.string :currency, null: false
      t.integer :quantity, null: false
      t.boolean :status, null: false
      t.references :vouchers, null: false, foreign_key: true
      t.references :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
