class Public::PostCommentsController < ApplicationController

  def create
    spot = Spot.find(params[:spot_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.spot_id = spot.id
    comment.save
    redirect_to spot_path(spot)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to spot_path(params[:spot_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
