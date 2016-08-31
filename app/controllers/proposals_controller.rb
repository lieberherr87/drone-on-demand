class ProposalsController < ApplicationController
  before_action :set_proposal, except: [:accept, :show]
  before_action :set_request, only: [:new, :create]

  def index
    if current_user.pilot
      @proposals = current_user.proposals
    else
      redirect_to root_path
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    redirect_to root_path if !@proposal.created_by(current_user) && !@proposal.request.created_by(current_user)
  end

  def new
    @proposal = current_user.proposals.new()
  end

  def create
    @proposal = @request.proposals.build(proposal_params)
    @proposal.user = current_user
    @proposal.save
    redirect_to proposal_path(@proposal)
  end

  def update
    @proposal.update(proposal_params)
    redirect_to proposal_path(@proposal)
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path
  end

  def accept
    proposal = Proposal.find_by(id:params[:id])
    if proposal && proposal.request.user_id == current_user.id
      proposal.accept
      redirect_to proposal_path(proposal)
    else
      redirect_to root_path
    end
  end

  def decline
    @proposal.rejected!
    redirect_to proposal_path(@proposal)
  end

private

  def set_request
    @request = Request.find(params[:request_id])
  end

  def set_proposal
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

