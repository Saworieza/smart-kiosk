class AddRevenueAndCostToStores < ActiveRecord::Migration
  def change
    add_column :stores, :revenue, :integer, null:false, default: 0
    add_column :stores, :cost, :integer, null: false, default: 0
  end
end
