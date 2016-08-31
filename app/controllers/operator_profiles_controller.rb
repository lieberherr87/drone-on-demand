class OperatorProfilesController < ApplicationController

  before_action :set_profile, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]


  def index
    redirect_to root_path
    @profile = policy_scope(OperatorProfile)
  end

  def show
  end

  def new
    @profile = OperatorProfile.new
    @profile.operator_skills.build
    @profile.videos.build
    @images = @profile.images.build
  end

  def create
    # @profile = OperatorProfile.new(profile_params)
      @profile = current_user.operator_profile
    if @profile.update(profile_params)
      #works
      flash[:notice] = "Successfully updated"
      redirect_to operator_profile_path(@profile)
    else
      render 'edit'
      #dont
    end

    # @profile = current_user.create_operator_profile(profile_params)
    # @profile.videos.first.operator_profile = @profile
    # @profile.save
    # if params.has_key? :images
    #   params[:images]['image'].each do |a|
    #     @image = @profile.images.create!(:image => a)
    #   end
    # end
    # redirect_to operator_profile_path(@profile)
  end

  def edit
    @profile =  current_user.operator_profile
    # @profile.operator_skills.build
  end

  def update
    @profile = current_user.operator_profile
    @profile.update(profile_params)
    if params.has_key? :images
      params[:images]['image'].each do |a|
        @image = @profile.images.create!(:image => a)
      end
    end
    redirect_to operator_profile_path(@profile)
    authorize @profile
  end

  def destroy
    authorize @profile
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
