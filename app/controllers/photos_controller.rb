class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:success] = 'Dodano zdjęcie'
      redirect_to @photo
    else
      flash.now[:danger] = 'Nie można dodać zdjęcia'
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:success] = 'Zapisano zmiany'
      redirect_to @photo
    else
      flash.now[:danger] = 'Nie można zapisać zmian:('
      render :edit
    end

  end

  def destroy
    respond_to do |format|
      if @photo.destroy
        flash[:success] = 'Skasowano zdjęcie'
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

  def set_photo
    @photo = Photo.find(params[:id])
  end
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
