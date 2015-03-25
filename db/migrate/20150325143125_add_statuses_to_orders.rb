class AddStatusesToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :status, :integer, :limit => 1
  end
end
