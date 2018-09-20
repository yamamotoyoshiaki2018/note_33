class NotesController < ApplicationController

  def index
    @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id],post_image_id: params[:post_image_id])
    # @like = Like.create(user_id: current_user.id, post_text_id: params[:post_text_id])
    # if params[:tag]
    #   @post_texts = PostText.tagged_with(params[:tag]).order("created_at DESC")
    # else
    #   @post_texts = PostText.includes(:user).order("created_at DESC")
    # end

    @notes = Note.includes(:user).order("created_at DESC")
    @magazines = Magazine.where(magazine_author_id: current_user.id).order("updated_at DESC")
  end

  def edit
    # ダミー
    @note = Note.find(params[:id])
    @notes = Note.includes(:user).order("created_at DESC")
    @post_text = PostText.find(params[:id])
  end

end


