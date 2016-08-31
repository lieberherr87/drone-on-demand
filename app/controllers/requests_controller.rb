class RequestsController < ApplicationController
  before_action :set_request

  def index
    if current_user.pilot
      @requests = Request.open
    else
      @requests = current_user.requests
    end
  end

  def show
    @request = Request.find_by(id: params[:id])
    redirect_to root_path if @request.blank?
    @request_coordinates = { lat: @request.latitude, lng: @request.longitude }

    @hash = Gmaps4rails.build_markers(@request) do |request, marker|
      marker.lat request.latitude
      marker.lng request.longitude
      # marker.infowindow render_to_string(partial: "/requests/map_box", locals: { request: request })
    end
    redirect_to root_path if !@request.created_by(current_user) && !current_user.pilot
  end

  def new
    @request = Request.new
  end

  def create
    if current_user.pilot
      redirect_to root_path
    else
      @request = current_user.requests.create(request_params)
      redirect_to requests_path
    end
  end

  def edit
  end

  def update
    authorize @request
    @request.update(request_params)
    redirect_to request_path(@request)
  end

  def destroy
    authorize @request
    @request.destroy
    redirect_to requests_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      if current_user
        @request = current_user.requests.find_by(id: params[:id])
      else
        redirect_to root_path
      end
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:due_date, :location, :details, :category)
    end
end



