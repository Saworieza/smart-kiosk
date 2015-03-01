class CreateKiosks < ActiveRecord::Migration
  def change
    create_table :kiosks do |t|
      t.string :unique_id, null: false
      t.string :password, null: false
      t.string :beacon_uuid, null: false
      t.references :store, index: true
      t.references :vendor, index: true

      t.timestamps null: false
    end
    add_index :kiosks, :unique_id, unique: true
    add_foreign_key :kiosks, :stores
    add_foreign_key :kiosks, :vendors
  end
end
