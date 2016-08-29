class ProposalMailer < ApplicationMailer

  def proposal_submitted(proposal)
    @greeting = "Hi"
    @proposal = proposal
    @operator_profile = proposal.user.operator_profile

    mail(to: @proposal.request.user.email, subject: "A new proposal has been submitted!")
  end
end
