class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_operator_profile_path(current_user.operator_profile) # Or :prefix_to_your_route
  end
end
