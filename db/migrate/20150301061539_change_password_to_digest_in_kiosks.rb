class ChangePasswordToDigestInKiosks < ActiveRecord::Migration
  def change
    remove_column :kiosks, :password
    add_column :kiosks, :password_digest, :text
  end
end
