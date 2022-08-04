class UserController < ApplicationController
  # def index
  #   @user = current_user
  # end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
