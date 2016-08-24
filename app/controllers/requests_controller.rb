class RequestsController < ApplicationController
  before_action :set_request

  def index
    if user_signed_in? && current_user.pilot
      @requests = Request.all
    elsif user_signed_in? && !current_user.pilot
      @requests = current_user.requests
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    if user_signed_in? && !current_user.pilot
      @request = current_user.requests.create(request_params)
      redirect_to requests_path
    else
      redirect_to new_user_session_path
    end
  end

  def edit
  end

  def update
    @request.update(request_params)
    redirect_to requests_path
    authorize @request
  end

  def destroy
    @request.destroy
    redirect_to requests_path
    authorize @request
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      if current_user
        @request = current_user.requests.find_by(id: params[:id])
      else
        redirect_to new_user_session_path
      end
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:due_date, :location, :details, :category)
    end
end



