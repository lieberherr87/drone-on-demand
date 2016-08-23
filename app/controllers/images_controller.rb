class ImagesController < ApplicationController
  def new
  end

  def create

  end

private
  def image_params
    params.require(:image).permit({droneimages: []})
  end


end
