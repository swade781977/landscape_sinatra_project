class DeletePasswordDigestColumnFromCustomersTable < ActiveRecord::Migration
  def change
    remove_column(:customers, :password_digest)
  end
end
