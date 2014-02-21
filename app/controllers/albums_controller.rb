class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new(:band_id => params[:band_id])
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :live, :name, :year)
  end
end
