class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.string :product_type, null: false
      t.boolean :status, null: false
      t.references :brands, null: false, foreign_key: true

      t.timestamps
    end
  end
end
