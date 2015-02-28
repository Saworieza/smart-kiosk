class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :user, index: true
      t.string :token
      t.boolean :enabled
      t.string :platform

      t.timestamps null: false
    end
    add_foreign_key :devices, :users
  end
end
