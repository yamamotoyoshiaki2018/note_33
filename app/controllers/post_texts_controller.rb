class PostTextsController < ApplicationController

  def index
    @post_texts = PostText.includes(:user).order("created_at DESC")
  end

  def new
    @post_text = PostText.new
  end

  def create
    PostText.create(header_image: note_params[:header_image], image: note_params[:image], title: note_params[:title], text: note_params[:text], user_id: current_user.id)
    redirect_to post_texts_path
    # redirect_to root_path
  end

  def show
      @post_text = PostText.find(params[:id])
      @comments = @post_text.comments.includes(:user)
  end

  def destroy
    post_text = PostText.find(params[:id])
    if post_text.user_id == current_user.id
      post_text.destroy
    end
    redirect_to post_texts_path
  end

  def edit
      @post_text = PostText.find(params[:id])
  end

  def update
    post_text = PostText.find(params[:id])
    if post_text.user_id == current_user.id
      post_text.update(note_params)
    end
    redirect_to post_texts_path
  end


  private
  def note_params
    params.require(:post_text).permit(:header_image, :image, :title, :text)
  end
end








