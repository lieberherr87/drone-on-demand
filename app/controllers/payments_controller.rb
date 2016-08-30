class PaymentsController < ApplicationController
  before_action :set_proposal, :set_request

  def new
  end

  def create
    @price_cents = @proposal.price_cents

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @price_cents, # in cents
      description:  "Payment for proposal by #{@proposal.user.operator_profile.company_name} for request #{@request.id}",
      currency:     'usd'
    )

    @proposal.update(payment: charge.to_json, status: 3)
    redirect_to proposal_path(@proposal)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

private

  def set_proposal
    @proposal =  Proposal.where(status:2).find(params[:proposal_id])
  end

  def set_request
    @request = @proposal.request
  end
end
