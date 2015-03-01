class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :number_of_items, null: false, default: 0
      t.string :avatar
      t.references :vendor, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :vendors
  end
end
