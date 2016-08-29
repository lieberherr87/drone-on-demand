class ProposalMailer < ApplicationMailer
  def proposal_submitted
    @proposal = Proposal.first
    UserMailer.proposal_submitted(@proposal)
  end
end
