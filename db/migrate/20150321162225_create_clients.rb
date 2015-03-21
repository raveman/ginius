class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :phone
      t.text :address
      t.text :comment

      t.timestamps null: false
    end
  end
end
