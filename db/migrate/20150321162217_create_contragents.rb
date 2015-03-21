class CreateContragents < ActiveRecord::Migration
  def change
    create_table :contragents do |t|
      t.string :name
      t.text :service
      t.string :contact
      t.string :phone
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
