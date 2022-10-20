class AddIndexToProducts < ActiveRecord::Migration[7.0]
  def change
    add_index(:products, :product_name)
    add_index(:products, :product_type)
  end
end
