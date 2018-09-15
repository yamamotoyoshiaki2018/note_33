class NotesController < ApplicationController

  def index
    # @post_text = PostText.find(id: params[:post_text_id])
    @post_text = PostText.new
    @post_texts = PostText.includes(:user).order("created_at DESC")

  end



end


