class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.text :comment
      t.integer :client
      t.integer :operator

      t.timestamps null: false
    end
    add_index :orders, :client
    add_index :orders, :operator
  end
end
