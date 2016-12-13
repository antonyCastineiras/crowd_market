class AddUserRefToAdverts < ActiveRecord::Migration[5.0]
  def change
    add_column :adverts, :user_id, :integer
  end
end
