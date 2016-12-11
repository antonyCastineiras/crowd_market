class RemoveSellerIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :seller_id, :integer
  end
end
