class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  
  def new
    @spot = Spot.new
  end

  # 投稿データの保存
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id # ユーザーと紐づける
    if @spot.save
      redirect_to spot_path(@spot), notice: '投稿が保存されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def index
    @spots = Spot.order(created_at: :desc)
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(@spot), notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to spots_path, notice: '削除しました'
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :body, :image)
  end

  def set_spot
    @spot =Spot.find(params[:id])
  end

  def authorize_user!
    unless @spot.user == current_user
      redirect_to  spots_path, alert: "権限がありません"
    end
  end
end
