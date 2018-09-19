class PostImagesController < ApplicationController
  def index
    @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id],post_image_id: params[:post_image_id])
    if params[:tag]
      @post_images = PostImage.tagged_with(params[:tag]).order("created_at DESC")
    else
      @post_images = PostImage.includes(:user).order("created_at DESC")
    end
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(
      image: image_params[:image],
      title: image_params[:title],
      image_description: image_params[:image_description],
      remove_image: image_params[:remove_image],
      image_cache: image_params[:image_cache],
      user_id: current_user.id)
    @post_image.tag_list.add(image_params[:tag_list], parse: true)
    @post_image.save
    note = Note.new(user_id: current_user.id, post_image_id: @post_image.id)
    note.save
    redirect_to post_images_path
  end

  def destroy
    post_image = PostImage.find(params[:id])
    if post_image.user_id == current_user.id
      Note.find_by(post_image_id: post_image.id).delete
      post_image.destroy
    end
    redirect_to post_images_path
  end

  def show
    @post_image = PostImage.find(params[:id])
    # @comments = @post_image.comments.includes(:user)
    # @like = Like.create(user_id: current_user.id, post_image_id: params[:post_image_id])
    @comments = @post_image.comments.includes(:user)
    @magazines = Magazine.where(magazine_author_id: current_user.id)
  end


  def edit
      @post_image = PostImage.find(params[:id])
  end

  def update
    post_image = PostImage.find(params[:id])
    if post_image.user_id == current_user.id
      post_image.update(image_params)
    end
    redirect_to post_images_path
  end


  private
  def image_params
    params.require(:post_image).permit(
      :image,
      :title,
      :image_description,
      :remove_image,
      :image_cache,
      :tag_list
      )
  end
end
