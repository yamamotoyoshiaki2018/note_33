class CommentsController < ApplicationController
  def create
    @comment = Comment.create(
      text: comment_params[:text],
      post_text_id: comment_params[:post_text_id],
      post_image_id: comment_params[:post_image_id],
      user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to post_image_path(params[:post_image_id])  }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to post_image_path(params[:post_image_id])}
        format.json
      end
    end
  end

  private
  def comment_params
    params.permit(:text, :post_text_id, :post_image_id)
  end
end


