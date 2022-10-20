class AddIndexToBrands < ActiveRecord::Migration[7.0]
  def change
    add_index(:brands, :name, unique: true)
    add_index(:brands, :email, unique: true)
    add_index(:brands, :address)
  end
end
