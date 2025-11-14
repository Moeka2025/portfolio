class UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @user = current_user
    @spots = @user.spots.order(created_at: :desc)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    reset_session
    redirect_to root_path, notice: "退会しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
