class RemoveExpiresOnFromVouchers < ActiveRecord::Migration[7.0]
  def change
    remove_column(:vouchers, :expires_on)
  end
end
