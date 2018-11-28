class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.decimal :price
      t.integer :quantity
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
