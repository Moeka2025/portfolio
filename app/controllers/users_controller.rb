class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def mypage
    @user = current_user
    @spots = @user.spots.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
