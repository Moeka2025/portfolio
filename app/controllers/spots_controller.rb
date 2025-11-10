class SpotsController < ApplicationController
  
  def new
    @spot = Spot.new
  end

  # 投稿データの保存
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id # ユーザーと紐づける

    if @spot.save
      redirect_to spots_path, notice: '投稿が保存されました'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def index
    @spot_images = Spot.all
  end

  def show
  end

  def edit
    @spot = Spot.find(params[:id])
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :body)
  end

end
