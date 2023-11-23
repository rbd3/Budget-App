class OperationsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations.order(created_at: :desc)
    @total = @operations.sum(:amount)
    @user = current_user
  end

  def new
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @operation = @group.operations.new
  end

  def create
    @group = Group.includes(:operations).find(params[:group_id])
    @operation = @group.operations.new(operation_params)
    @operation.user = current_user

    if @operation.save
      redirect_to user_group_path(current_user, @group), notice: 'Operation successfully created'
    else
      render :new
    end
  end

  def destroy
    @operation = Operation.find(params[:id])
    @group = @operation.group
    @operation.destroy
    redirect_to user_group_path(current_user, @group), notice: 'Operation successfully deleted'
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :group_id)
  end
end
