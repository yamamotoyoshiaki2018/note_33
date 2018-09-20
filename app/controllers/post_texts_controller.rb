class PostTextsController < ApplicationController

  def index
    @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id])
    if params[:tag]
      @post_texts = PostText.tagged_with(params[:tag]).order("created_at DESC")
    else
      @post_texts = PostText.includes(:user).order("created_at DESC")
    end

  end

  def new
    @post_text = PostText.new
  end

  def create
    @post_text = PostText.new(
      header_image: note_params[:header_image],
      image: note_params[:image],
      title: note_params[:title],
      text: note_params[:text],
      remove_header_image: note_params[:remove_header_image],
      remove_image: note_params[:remove_image],
      image_cache: note_params[:image_cache],
      user_id: current_user.id)
    @post_text.tag_list.add(note_params[:tag_list], parse: true)
    @post_text.save
    note = Note.new(user_id: current_user.id, post_text_id: @post_text.id)
    note.save
    redirect_to root_path
  end

  def show
      @post_text = PostText.find(params[:id])
      @comments = @post_text.comments.includes(:user)
      @magazines = Magazine.where(magazine_author_id: current_user.id)
  end

  def destroy
    post_text = PostText.find(params[:id])
    if post_text.user_id == current_user.id
      post_text.destroy
    end
    redirect_to root_path
  end

  def edit
      @post_text = PostText.find(params[:id])
  end

  def update
    post_text = PostText.find(params[:id])
    if post_text.user_id == current_user.id
      post_text.update(note_params)
    end
    redirect_to root_path
  end

  private
  def note_params
    params.require(:post_text).permit(
      :header_image,
      :image,
      :title,
      :text,
      :remove_header_image,
      :remove_image,
      :image_cache,
      :tag_list
      )
  end
end









