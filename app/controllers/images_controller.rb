class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  def destroy
    @image = current_user.Image.find(params[:id])
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
