class NotesController < ApplicationController
  def index
    # @post_text = PostText.find(id: params[:post_text_id])

    @post_text = PostText.new
    @note = Note.new
    @notes = Note.includes(:user).order("created_at DESC")
  end

  # def note_params
  #   params.require(:note).permit(:post_text_id, :post_image_id, :post_talk_id).merge(user_id: current_user.id)
  # end

end


