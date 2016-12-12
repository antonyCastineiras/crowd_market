class Payment < ApplicationRecord
  def process_payment
   customer = Stripe::Customer.create email: email,
                                      card: card_token

   Stripe::Charge.create customer: customer.id,
                         amount: product.price * 100,
                         description: product.name,
                         currency: 'gbp'

 end
end
