class AddColumnsToSellers < ActiveRecord::Migration[5.0]
  def change
    add_column :sellers, :shop_name, :string
    add_column :sellers, :first_name, :string
    add_column :sellers, :last_name, :string
  end
end
