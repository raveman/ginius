class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.text :comment
      t.integer :profile_id

      t.timestamps null: false
    end
    add_index :orders, :profile_id
  end
end
