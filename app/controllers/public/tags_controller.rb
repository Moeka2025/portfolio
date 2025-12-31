class Public::TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @spots = @tag.spots.order(created_at: :desc)
    @spots = @tag.spots.page(params[:page]).per(5)
  end
end
