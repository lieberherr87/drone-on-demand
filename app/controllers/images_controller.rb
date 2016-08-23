class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    raise
    @image = Image.new(image_params)
    @image.save
  end

private
  def image_params
    params.require(:image).permit({droneimages: []})
  end

end
