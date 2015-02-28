class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :address, null: false, default: ""
      t.references :vendor, index: true

      t.timestamps null: false
    end
    add_foreign_key :stores, :vendors
  end
end
