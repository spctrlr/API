class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.decimal :balance, precision: 10, scale: 2
      t.string :currency, null: false
      t.string :secret_code, null: false
      t.date :expires_on, null: false
      t.references :users, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
