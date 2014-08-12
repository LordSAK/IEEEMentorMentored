class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user=User.find(params[:id])
    @user_name=@user.First_Name
    if !@user.Last_Name.blank?
      @user_name += " "+@user.Last_Name
    end
  end

  def new
    @InterestAreas=Interest.order("id asc").all
    @Societies=Societies.all
    @work_sector=WorkSector.all
    @Partnerships=MentoringPartnership.all
    @user = User.new
  end

  def new1
    @InterestAreas=Interest.order("id asc").all
    @Societies=Societies.all
    @work_sector=WorkSector.all
    @Partnerships=MentoringPartnership.all
    @user = User.new
  end

  def create
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      @user.update_attribute(:Account,"normal")
      sign_in @user
      flash[:success] = "Welcome to the Mentor Mentored!"
      redirect_to '/availabilities'
    else
      render 'new'
    end
  end

  def create1
    @students=Students.all
    @entrepreneurs=Entrepreneurs.all
    @veterans=Veterans.all
    @user = User.new(company_params)    # Not the final implementation!
    if @user.save
      @user.update_attribute(:Account,"company")
      sign_in @user
      flash[:success] = "Welcome to the Mentor Mentored!"
      redirect_to '/availabilities'
    else
      render 'new1'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

	private

    def user_params
      params.require(:user).permit(:First_Name,:Last_Name, :email, :password,
                                   :password_confirmation, :user_Type, :SkillType, :user_Need,
                                   :SkillType1, :SkillNeed1, :SkillType2, :skillNeed2,:photo,
                                   :user_City,:user_State,:user_Zip, :photo_file_name,
                                   :photo_content_type,:photo_file_size,:photo_updated_at,
                                   :auth_token,:password_reset_token,:password_reset_sent_at,
                                   :interest,:societies,:sector,:partnership)
    end

    def company_params
      params.require(:user).permit(:CompanyName,:AlternateName,:email,:password,:password_confirmation,
        :Selector,:From,:To,:user_City,:user_State,:user_Zip, :photo_file_name,
                                   :photo_content_type,:photo_file_size,:photo_updated_at,
                                   :auth_token,:password_reset_token,:password_reset_sent_at,
                                   :interest)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
