class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_description
      t.decimal :price
      t.decimal :sellers_fee
      t.integer :seller_id

      t.timestamps
    end
  end
end
