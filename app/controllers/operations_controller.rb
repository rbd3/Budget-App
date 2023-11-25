class OperationsController < ApplicationController
  def index
    @groups = Group.all.order(created_at: :desc)
    @transactions_by_group = {}

    # Group transactions by their associated group
    @groups.each do |group|
      @transactions_by_group[group] = group.operations.order(created_at: :desc)
    end

    @total_by_group = {}

    # Calculate total amount for each group
    @transactions_by_group.each do |group, transactions|
      @total_by_group[group] = transactions.sum(:amount)
    end
  end

  def show
    @group = Group.find(params[:group_id])
    @operations = @group.operations
    @operation = @operations.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @operation = @group.operations.new
  end

  def create
    @group = Group.find(params[:group_id])

    @operation = @group.operations.create(name: operation_params[:name], amount: operation_params[:amount],
                                          user_id: current_user.id, group_id: @group.id)

    if @operation.save
      # Handle the selected group IDs
      @operation.group_ids = params[:operation][:group_ids]

      redirect_to group_operations_path(@group), notice: 'Operation successfully created'
    else
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :group_id)
  end
end
