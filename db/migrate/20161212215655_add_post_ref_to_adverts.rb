class AddPostRefToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :post_id, :integer
  end
end
