class PagesController < ApplicationController
  def index
    @pilots = OperatorProfile.all
  end

  def profile
    @user = current_user
  end
end
