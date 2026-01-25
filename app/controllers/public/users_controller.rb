class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    
# フォームの :spot_name (検索ワード) と :method (検索手法) を使用
if params[:spot_name].present?
  content = params[:spot_name]
  method = params[:method]

  case method
  when 'perfect'
    @users = @users.where(name: content)
  when 'backward'
    @users = @users.where('name LIKE ?', "%#{content}")
  when 'partial'
    @users = @users.where('name LIKE ?', "%#{content}%")
  else
    @users = @users.where('name LIKE ?', "%#{content}%")
  end
end
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
