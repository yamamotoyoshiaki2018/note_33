class NotesController < ApplicationController

  def index
    @post_texts = PostText.includes(:user).order("created_at DESC")
    @notes = Note.includes(:user).order("created_at DESC")
    @magazines = Magazine.where(magazine_author_id: current_user.id).order("updated_at DESC")
    # binding.pry
  end

  def edit
    # ダミー
    @note = Note.find(params[:id])
    @notes = Note.includes(:user).order("created_at DESC")
    @post_text = PostText.find(params[:id])
  end

end
