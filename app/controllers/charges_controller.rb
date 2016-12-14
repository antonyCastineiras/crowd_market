class ChargesController < ApplicationController

  def new
    @seller = Seller.find(params[:seller_id])
    @product = Product.find(params[:product_id])
    @advertiser = User.find(params[:advertiser_id]) if params[:advertiser_id]
  end

  def create
    # Amount in cents
    
    amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'gbp'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def charge_params
    params.require(:charge).permit(:seller_id,:product_id,:advertiser_id)
  end

end
