class MagazinesController < ApplicationController

  def index
    @magazine = Magazine.find(params[:id])
    @magazines = Magazine.where(magazine_author_id: @user.id)
  end

  def new
    @magazine = Magazine.new
  end

  def show
    @magazine = Magazine.find(params[:id]).order("updated_at DESC")
  end

  def edit
    @magazine = Magazine.find(params[:id])
    # @magazines = Magazine.where(author_id: current_user.id)
  end

  def update
    magazine = Magazine.find(params[:id])
    magazine.update(magazine_params) if magazine.magazine_author_id == current_user.id
    redirect_to magazine_path(params[:id]), notice: 'マガジンを更新しました'
  end

  def create
    @magazine = Magazine.new(magazine_params)

    # @magazine.note << Note.find_by(post_text_id: params[:id])

    # @magazine = Magazine.new(magazine_params)
    if @magazine.save
      redirect_to magazines_user_path(current_user), notice: 'マガジンを作成しました'
    else
      render :new
    end
  end

  private
  def magazine_params
    params.require(:magazine).permit(:magazine_title, :magazine_description, :magazine_header_image, :magazine_author_id, { note_ids: [] })
  end

end
