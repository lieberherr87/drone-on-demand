class ProposalsController < ApplicationController
  before_action :set_proposal

  def index
    if user_signed_in? && current_user.pilot
      @proposals = Proposal.all
    elsif user_signed_in? && !current_user.pilot
      @proposals = current_user.proposals
    else
      redirect_to new_user_session_path
    end
  end

  def show

  end

  def new
    @request = Request.find(params[:request_id])
    @proposal = current_user.proposals.new()
  end

  def create
    @request = Request.find(params[:request_id])
    @proposal = @request.proposals.build(proposal_params)
    @proposal.user = current_user
    @proposal.save
    redirect_to proposal_path(@proposal)
  end

  def edit
  end

  def update
    @proposal.update(proposal_params)
    redirect_to proposal_path(@proposal)
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path
  end

private

  def set_proposal
  # Use callbacks to share common setup or constraints between actions.
    if current_user
      @proposal = current_user.proposals.find_by(id: params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  # Only allow a trusted parameter "white list" through.
  def proposal_params
    params.require(:proposal).permit(:date, :price, :content, :status)
  end
end

