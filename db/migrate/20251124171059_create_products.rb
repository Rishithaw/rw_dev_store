class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :base_price
      t.references :category, null: false, foreign_key: true
      t.integer :stock_quantity
      t.string :product_type
      t.boolean :on_sale
      t.decimal :sale_price
      t.boolean :featured
      t.string :digital_file_url
      t.integer :digital_file_size

      t.timestamps
    end
  end
end
