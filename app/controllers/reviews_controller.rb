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
    @proposal = Proposal.find(params[:proposal_id])
    @review = Review.new(review_params)
    @review.proposal = @proposal
    if @review.save
      flash[:notice] = "Your review has been created"
      redirect_to proposal_path(@proposal)
    else
      flash[:alert] = "There has been an error"
      redirect_to  new_proposal_review_path(@proposal)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end
end
