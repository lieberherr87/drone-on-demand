class OperatorProfilesController < ApplicationController

  # before_action :set_profile, only: [:show, :edit]

  def index
    @operator_profiles = OperatorProfile.all
  end

  def show
  end

  def new
    @profile = OperatorProfile.new
  end

  def create
    @profile = OperatorProfile.new(profile_params)
    @profile.user = current_user
    @profile.save
    raise
  end

  def edit
    @profile =  current_user.operator_profile
  end

  def update
  end

  def destroy
  end

  private

  def set_profile
    @profile = OperatorProfile.find([:id])
  end

  def profile_params
    params.require(:operator_profile).permit(:company_name, :description, :skills, {images: []})
  end
end
