class ChangeFriendshipsConfirmedColumnToStatus < ActiveRecord::Migration[5.0]
  def change
  	rename_column :friendships, :confirmed, :status
  end
end
