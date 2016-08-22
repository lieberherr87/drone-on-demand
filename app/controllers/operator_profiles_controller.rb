class OperatorProfilesController < ApplicationController

  before_action :set_profile, only: [:show]

  def index
  end

  def show
  end

  def new
    @operator_profile = OperatorProfile.new
  end

  def create

    @operator_profile = current_user.operator_profile.build(profile_params)
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
