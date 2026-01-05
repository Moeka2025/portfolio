class Public::TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])

    @total_spots_count = @tag.spots.count

    @spots = @tag.spots
    case params[:sort]
    when "new"
      @spots = @spots.order(created_at: :desc)
    when "star"
      @spots = @spots.order(star: :desc)
    end

    @spots = @spots.page(params[:page]).per(5)

  end
end
