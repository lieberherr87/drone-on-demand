class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: :profile
  def index
    @top_pilots = User.where(pilot: true).limit(3)
  end

  def profile
    @user = current_user
  end

  def about

  end
end
