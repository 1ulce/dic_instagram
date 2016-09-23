class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def show
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      # 一覧画面へ遷移して"画像を作成しました！"とメッセージを表示します。
      redirect_to pictures_path, notice: "画像を作成しました！"
    else
      # 入力フォームを再描画します。
      render action: 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "画像を編集しました！"
    else
      # 入力フォームを再描画します。
      render action: 'edit'
    end
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "画像を削除しました！"
  end
  # def confirm
  #   @picture = Picture.new(pictures_params)
  #   render :new if @picture.invalid?
  # end
  private
    def pictures_params
      params.require(:picture).permit(:image, :image_cache)
    end
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
