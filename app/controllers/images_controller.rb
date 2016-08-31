class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def new
    @operator_profile = OperatorProfile.find(params[:operator_profile_id])
    @image = Image.new
  end

  def create
    @operator_profile = OperatorProfile.find(params[:operator_profile_id])

    @image = @operator_profile.images.build(image_params)

    @image.save
    redirect_to profile_path
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image.post, notice: 'Post attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to profile_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image, :image_cache)
    end
end
