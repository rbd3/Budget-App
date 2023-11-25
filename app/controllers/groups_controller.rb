class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    authorize! :index, Group
    @groups = Group.order('created_at DESC')
  end

  def show
    @group = Group.includes(:operations).find(params[:id])
    @operations = @group.operations
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render 'new', status: 422
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
