class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])

  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :edit
    end

  end

  def destroy
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @photo.destroy
        format.html { redirect_to photos_path, notice: 'Photo was deleted' }
        format.js
        format.json { render json: @photo, status: :ok, location: @photo }
      else
        format.html { render action: :index }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end



  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
