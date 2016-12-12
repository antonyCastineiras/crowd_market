class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @payment = Payment.new payment_params.merge(email: stripe_params["stripeEmail"],
                                                               card_token: stripe_params["stripeToken"])
    raise "Please, check payment errors" unless @payment.valid?
    @payment.process_payment
    @payment.save
    redirect_to @payment, notice: 'Payment was successfully created.'
  rescue
    flash[:error] = "error"
    render :new
  end

  def new
    @product = Product.find(params[:id])
    @payment = Payment.new
  end

  private
    def stripe_params
      params.permit :stripeEmail, :stripeToken
    end
end
