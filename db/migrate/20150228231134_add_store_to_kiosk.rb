class AddStoreToKiosk < ActiveRecord::Migration
  def change
    add_reference :kiosks, :store, index: true
    add_foreign_key :kiosks, :stores
    add_column :kiosks, :beacon_uuid, :string, null: false, default: ""
  end
end
