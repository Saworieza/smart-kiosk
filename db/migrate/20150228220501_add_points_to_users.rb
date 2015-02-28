class AddPointsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer, null: false, default: 0
    add_column :users, :level, :integer, null: false, default: 0
  end
end
