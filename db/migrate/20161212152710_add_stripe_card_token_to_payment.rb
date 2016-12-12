class AddStripeCardTokenToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :card_token, :string
  end
end
