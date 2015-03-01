class AddPriceAndDescriptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :price, :integer, null: false, default: 0
    add_column :items, :description, :string
  end
end
