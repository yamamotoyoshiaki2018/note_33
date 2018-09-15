class NotesController < ApplicationController

  def index
    # @post_text = PostText.find(id: params[:post_text_id])
    @post_text = PostText.new
    @post_texts = PostText.includes(:user).order("created_at DESC")

  end

  def edit
    @note = Note.find(params[:id])
    @notes = Note.includes(:user).order("created_at DESC")
    @post_text = PostText.find_by()
      @post_text = PostText.find(params[:id])
      Note.find_by(post_text_id: post_text.id).delete
    # if params[:tag]
    #   @post_texts = PostText.tagged_with(params[:tag]).order("created_at DESC")
    # else
    #   @post_texts = PostText.includes(:user).order("created_at DESC")
    # end
  end

end
