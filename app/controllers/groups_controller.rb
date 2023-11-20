class GroupsController < ApplicationController
    load_and_authorize_resource through: :user
  
    def index
        @groups = current_user.groups.includes(:operations)
      end
    
      def show
        @group = Group.includes(:operations).find(params[:id])
        @operations = @group.operations
      end
    
      def new
        @post = Post.new
      end
    
      def create
        @group = current_user.groups.new(group_params)
    
        if @group.save
          redirect_to user_groups_path(current_user)
    
        else
          flash[:alert] = 'Something went wrong'
          render 'new'
        end
      end
    
    def destroy
        group = Group.find(params[:id])
        authorize! :destroy, group
    
        group.operations.destroy_all
        if group.destroy
          flash[:success] = 'Post deleted successfully'
          redirect_to user_groups_path(current_user)
        else
          flash.now[:error] = 'Error: Post could not be deleted'
          redirect_to user_group_path(current_user, group)
        end 
        
        private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

end
