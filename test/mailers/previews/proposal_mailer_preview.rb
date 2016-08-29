class ProposalMailerPreview < ActionMailer::Preview
  def proposal_submitted
    @proposal = Proposal.first
    ProposalMailer.proposal_submitted(@proposal)
  end
end
