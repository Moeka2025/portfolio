class Public::SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :destroy, :update]
  
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
    @spots = Spot.includes(:post_comments)
    if params[:spot_name].present? # 検索フォームで入力したタイトルをもとにデータを取得
      @spots = Spot.where("title LIKE ?", "%#{params[:spot_name]}%")
    else
      @spots = Spot.order(created_at: :desc)
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @post_comment = PostComment.new
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
    redirect_to root_path, notice: '削除しました'
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :body, :image, :star)
  end

  def set_spot
    @spot =Spot.find(params[:id])
  end

  def authorize_user!
    redirect_to spots_path, alert: "権限がありません" if @spot.user != current_user
  end
  

end
