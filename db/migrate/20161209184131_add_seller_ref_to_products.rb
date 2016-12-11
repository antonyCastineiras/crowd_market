class AddSellerRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :seller_id, :integer
  end
end
