class GroupsController < ApplicationController
  def new
  	@group=Group.new
  end

  def create
    @group = Group.new(group_params)    # Not the final implementation!
    if @group.save
      @groupUser=GroupUser.new(:group_id => @group.id,:user_id => current_user.id,:admin => "Y",:approval=>"Approved")
      @groupUser.save
      redirect_to group_path(@group.id)
    else
      render 'new'
    end
  end

  def show
  	@group=Group.find(params[:id])
  	@groupusers=User.joins("INNER JOIN group_users ON group_users.user_id=users.id and approval='Approved'").where("group_id = ?",params[:id])
    @user = Userrequest.select('"RequestFrom"').where('"RequestTo" = ? AND "IsApproved" = ?', current_user.id, "1")
    @grouping=GroupUser.where("group_id= ? and  user_id=?",@group.id,current_user.id)
    @requestsent=User.joins("INNER JOIN group_users ON group_users.user_id=users.id and approval='Wait'").where("group_id = ?",params[:id])
  end

  def autocomplete
    @posts = User.autocomplete(:First_Name, params[:q])
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def add
    groupuser=GroupUser.new(:group_id => params[:g_id], :user_id => params[:u_id],:approval => "Approved")
    groupuser.save
    redirect_to '/groups/'+params[:g_id]
  end

  def index
    @groups=Group.joins("INNER JOIN group_users ON group_users.group_id=groups.id").where("group_users.user_id = ?", current_user.id )
  end

  def search
    keyword=params[:tf_keyword] unless params[:tf_keyword]==""
    if !keyword.nil?
      @groups=Group.where("? is null or groups.name LIKE ? or ? is null or groups.description LIKE ?","%#{keyword}%","%#{keyword}%","%#{keyword}%","%#{keyword}%")
    end
  end

  def add1
    groupuser=GroupUser.new(:group_id => params[:id], :user_id => current_user.id, :approval => "Approved")
    groupuser.save
    redirect_to "/groups/"+params[:id]
  end

  def join
    groupuser=GroupUser.new(:group_id => params[:id], :user_id => current_user.id, :approval => "Wait")
    groupuser.save
    redirect_to "/groups/"+params[:id]
  end

  def approve
    g_id=params[:id]
    user_id=params[:uid]
    groupuser=GroupUser.where("group_id = ? and user_id =? and approval='Wait'",g_id,user_id)
    groupuser.first.update_attribute(:approval, "Approved")
    redirect_to "/groups/"+params[:id]
  end

  def reject
    g_id=params[:id]
    user_id=params[:uid]
    groupuser=GroupUser.where("group_id = ? and user_id =? and approval='Wait'",g_id,user_id).destroy_all
    redirect_to "/groups/"+params[:id]
  end

  private

  def group_params
      params.require(:group).permit(:name, :description, :privacy)
    end
end
