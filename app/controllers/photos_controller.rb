class PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def new
    if params[:back]
      @photo = Photo.new(photos_params)
    else
      @photo = Photo.new
    end
  end

  def create
    @photo = Photo.new(photos_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path, notice: "写真とメッセージを投稿しました！"
      NoticeMailer.sendmail_photo(@photo).deliver
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photos_params)
    if @photo.save
      redirect_to photos_path, notice: "写真とメッセージを更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "写真とメッセージを削除しました！"
  end


  private
    def photos_params
      params.require(:photo).permit(:photo_title, :photo_message, :picture)
    end

end
