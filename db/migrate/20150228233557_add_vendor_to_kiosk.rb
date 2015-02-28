class AddVendorToKiosk < ActiveRecord::Migration
  def change
    add_reference :kiosks, :vendor, index: true
    add_foreign_key :kiosks, :vendors
  end
end
