class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(user_id: current_user.id)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    if @group.save
      flash[:notice] = 'Category was successfully created'
      redirect_to groups_path(params[user_id: current_user.id])
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end