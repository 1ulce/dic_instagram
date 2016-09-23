class TopController < ApplicationController
  def index
    if user_signed_in?
      redirect_to pictures_path
    end
    @user = User.new
  end
end