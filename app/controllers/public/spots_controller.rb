class Public::SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :destroy, :update]
  
  def new
    @spot = Spot.new
    @tag = Tag.new
  end

  # 投稿データの保存
  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id # ユーザーと紐づける
    tag_list = params[:spot][:tag_name].split(/[[:blank:]]/)
    if @spot.save
      @spot.save_tags(tag_list)
      redirect_to spot_path(@spot), notice: '投稿が保存されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def index
    @spots = Spot.includes(:post_comments)

    respond_to do |format|
      format.html do
        @spot = Spot.page(params[:page])
    
        # タイトル検索
        if params[:spot_name].present?
          @spots = @spots.where("title LIKE ?", "%#{params[:spot_name]}%")
        end

        # ユーザー検索
        if params[:model] == "user"
          redirect_to users_path(name: params[:spot_name], method: params[:method]) and return
        end

        # タグ検索
        if params[:tag_name].present?
          tag = Tag.find_by(name: params[:tag_name])
          @spots = tag.present? ? tag.spots : Spot.none
        end

        # 並び替え
        case params[:sort]
        when "new"
          @spots = @spots.order(created_at: :desc)
        when "star"
          @spots = @spots.order(star: :desc)
        else
          @spots = @spots.order(created_at: :desc)
        end

        # kaminari
        @spots = @spots.page(params[:page]).per(5)
      end

      format.json do
        @spots = Spot.all
      end
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @spot = Spot.find(params[:id])
    @tag_list = @spot.tags.pluck(:name).join(" ")
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.attributes = spot_params
    @spot.zipcode = params[:zipcode]
    tag_list = params[:spot][:tag_name].split(/[[:blank:]]/)

    if @spot.update(spot_params)
      @spot.save_tags(tag_list)
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
    params.require(:spot).permit(:title, :body, :image, :star, :address)
  end

  def set_spot
    @spot =Spot.find(params[:id])
  end

  def authorize_user!
    redirect_to spots_path, alert: "権限がありません" if @spot.user != current_user
  end
end
