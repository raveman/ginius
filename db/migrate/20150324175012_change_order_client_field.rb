class ChangeOrderClientField < ActiveRecord::Migration
  def change
  	rename_column :orders, :client, :client_id
  end
end
