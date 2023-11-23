class GroupsController < ApplicationController
  #load_and_authorize_resource through: :user

  def index
    authorize! :index, Group
    #@user = current_user
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
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render 'new', status: 422
    end
  end
    
  def destroy
    group = Group.find(params[:id])
    authorize! :destroy, group

    group.operations.destroy_all
    if group.destroy
      flash[:success] = 'Category deleted successfully'
      redirect_to groups_path
    else
      flash.now[:error] = 'Error: Category could not be deleted'
      redirect_to groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
