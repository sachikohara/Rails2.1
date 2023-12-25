class UsersController < ApplicationController  
  before_action :authenticate_user!

  def show
    @user = current_user
  end
  
  def edit_account
    @user = current_user
  end
  
  def update_account
    @user = current_user
    if @user.update_with_password(account_params)
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to user_path(@user)
    else
      render "edit_account"
    end
  end
  
  def edit_profile
    @user = current_user
  end
  
  def update_profile
    @user = current_user
    if @user.update(profile_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path(@user)
    else
      render "edit_profile"
    end
  end
  
  private
  
  def account_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
  
  def profile_params
    params.require(:user).permit(:name, :image, :profile)
  end
end