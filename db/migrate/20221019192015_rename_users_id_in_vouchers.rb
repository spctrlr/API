class RenameUsersIdInVouchers < ActiveRecord::Migration[7.0]
  def change
    rename_column(:vouchers, :users_id, :user_id)
  end
end
