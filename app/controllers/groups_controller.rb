class GroupsController < ApplicationController
  def index
    @groups = Group.all
    groups = @groups
    @mygroups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create(group_params)
    @group = Group.new
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, item_ids: [])
  end
end
