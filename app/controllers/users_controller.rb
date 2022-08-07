class UsersController < ApplicationController
  def index
    @user = current_user
  end

  # def index
  #   @users = User.all
  # end

  def show; end
end
