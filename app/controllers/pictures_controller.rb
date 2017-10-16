class PicturesController < ApplicationController
 before_action :authenticate_user!
 before_action :set_picture, only: %i[edit update destroy]
  def index
    @pictures = Picture.all.includes(:user)
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
      redirect_to pictures_path, notice: "写真を投稿しました！"
      #TODO:mailer実装後に有効化
      #NoticeMailer.sendmail_picture(@picture).deliver
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
  end
  
  def update
    @picture.update(pictures_params)
    redirect_to pictures_path
  end
  
  def destroy
    @picture.destroy
    redirect_to pictures_path
  end
  
  private
    def pictures_params
      params.require(:picture).permit(:caption,:picture)
    end
    
    def set_picture
      @picture = Picture.find(params[:id])
    end
end
