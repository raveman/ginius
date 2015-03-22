class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.text :comment
      t.references :client, index: true, foreign_key: true
      t.references :operator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
