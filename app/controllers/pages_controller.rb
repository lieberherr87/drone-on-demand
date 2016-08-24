class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @top_pilots = User.where(pilot: true).limit(4)
  end

  def profile
    @user = current_user
  end
end
