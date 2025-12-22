class Admin::SpotsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @spots = Spot.includes(:user).order(created_at: :desc)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_spots_path, notice: "投稿を削除しました。"
  end
end
