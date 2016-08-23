class OperatorProfilesController < ApplicationController

  before_action :set_profile, only: [:show]

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
  end

  def edit
    @profile =  current_user.operator_profile
  end

  def update
    @profile = current_user.operator_profile.update(profile_params)
    redirect_to operator_profile_path(@profile)
  end

  def destroy
  end

  private

  def set_profile
    @profile = OperatorProfile.find(params[:id])
  end

  def profile_params
    params.require(:operator_profile).permit(:company_name, :description, :skills, {images: []})
  end
end
