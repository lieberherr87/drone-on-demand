class OperatorProfilesController < ApplicationController

  before_action :set_profile, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]

  def show
  end

  def edit
    @profile =  current_user.operator_profile
    # @profile.operator_skills.build
  end

  def update
    @profile = current_user.operator_profile
    @profile.update(profile_params)
    flash[:notice] = "Your profile has been successfully updated"
    redirect_to operator_profile_path(@profile)
  end

  private

  def set_profile
    @profile = OperatorProfile.find_by(id:params[:id])
    if !current_user.operator_profile.eql?(@profile) && !current_user.pending_proposals.pluck(:user_id).include?(@profile.user_id)
      redirect_to root_path
    end
  end

  def profile_params
    params.require(:operator_profile).permit(:company_name, :description, :skills, {:skill_ids => []}, images_attributes: [:id, :image, :_destroy], videos_attributes: [:id, :url, :_destroy])
  end
end
