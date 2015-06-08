class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.text :description
      t.text :comment
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end
