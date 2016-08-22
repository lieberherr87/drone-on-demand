class OperatorProfilesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @profile = OperatorProfile.new
  end

  def create
    @profile = current_user.operator_profile.build(profile_params)
    @profile.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_profile
    @profile = OperatorProfile.find(params[:id])
  end

  def profile_params
    params.require(:operator_profile).permit(:company_name, :description, :skills)
  end
end
