# class PostTextsController < ApplicationController
class PostTextsController < NotesController

  def index
  end

  def new
    @post_text = PostText.new
  end

  def create
    post_text.create(header_image: note_params[:header_image], image: note_params[:image], title: note_params[:title], text: note_params[:text])
      # , user_id: current_user.id)
    redirect_to controller: :notes, action: :index
    # redirect_to root_path
  end


  private
  def note_params
    params.require(:post_text).permit(:header_image, :image, :title, :text)
  end
end








