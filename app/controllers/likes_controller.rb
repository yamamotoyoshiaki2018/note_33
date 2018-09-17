class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id],post_image_id: params[:post_image_id])
    @likes = Like.where(post_text_id: params[:post_text_id], post_image_id: params[:post_image_id])
    @post_texts = PostText.all
    @post_text = PostText.new

    @post_images = PostImage.all
    @post_image = PostImage.new
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_text_id: params[:post_text_id], post_image_id: params[:post_image_id])
    @like.destroy
    @likes = Like.where(post_text_id: params[:post_text_id],post_image_id: params[:post_image_id])
    @post_texts = PostText.all
    @post_images = PostImage.all
    @post_image = PostImage.new
    redirect_to root_path
  end
end

# class LikesController < ApplicationController
#   def create
#     @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id])
#     @likes = Like.where(post_text_id: params[:post_text_id])
#     @post_texts = PostText.all
#     redirect_to root_path
#   end

#   def destroy
#     @like = Like.find_by(user_id: current_user.id, post_text_id: params[:post_text_id])
#     @like.destroy
#     @likes = Like.where(post_text_id: params[:post_text_id])
#     @post_texts = PostText.all
#     redirect_to root_path
#   end
# end







# class LikesController < ApplicationController
#   def create
#     @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id])
#     @likes = Like.where(post_text_id: params[:post_text_id])
#     @post_texts = PostText.all
#     @post_text = PostText.new
#     respond_to do |format|
#       format.html { redirect_to post_texts_path }
#       format.js
#     end
#   end

#   def destroy
#     @like = Like.find_by(user_id: current_user.id, post_text_id: params[:post_text_id])
#     @like.destroy
#     @likes = Like.where(post_text_id: params[:post_text_id])
#     @post_texts = PostText.all
#     @post_text = PostText.new
#     respond_to do |format|
#       format.html { redirect_to post_texts_path }
#       format.js
#     end
#   end
# end
