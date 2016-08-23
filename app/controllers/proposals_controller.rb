class ProposalsController < ApplicationController
  before_action :set_proposal

  def index
    @proposals = current_user.proposals
  end

  def show

  end

  def new
    @proposal = current_user.proposals.new()
  end

  def create
    #request ID
    @operator_profile = Operator_profile.find(params[:operator_profile_id])
    @proposal = @operator_profile.proposals.build(booking_params)
    @proposal.user = current_user
    @proposal.save
    redirect_to proposal_path(@proposal)
  end

  def edit
  end

  def update
  end

  def destroy
    @proposals.destroy
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
  def proposal_param
    params.require(:proposal).permit(:date, :price, :content, :status)
  end

end
