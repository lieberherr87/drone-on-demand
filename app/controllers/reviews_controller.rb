class ReviewsController < ApplicationController
  before_action :find_proposal, only: [ :new, :create, :show]

  def index
    @proposal = Proposal.all
  end


  def show
    @review = Review.find[params:id]
  end

  def new
    @review = Review.new
  end

  def create
    @proposal = Proposal.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.proposal = @proposal
    if @review.save
      redirect_to proposal_path(@proposal)
    else
      render 'proposals/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_proposal
    @proposal = Proposal.find(params[:booking_id])
  end
end
