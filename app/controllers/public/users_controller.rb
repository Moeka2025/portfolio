class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @spots = @user.spots.order(created_at: :desc)
    @spots = @user.spots.page(params[:page])
  end

  def mypage
    @user = current_user
    @spots = @user.spots.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
