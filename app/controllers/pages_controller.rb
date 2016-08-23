class PagesController < ApplicationController
  def index
  end

  def profile
    @user = current_user
  end
end
