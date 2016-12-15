class AddProductRefToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :product_id, :integer
  end
end
