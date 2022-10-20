class CreateBrands < ActiveRecord::Migration[7.0]
  create_table :brands do |t|
    t.string :name, null: false
    t.string :address, null: false
    t.string :email, null: false
    t.boolean :status, null: false, default: false

    t.timestamps
  end
end
