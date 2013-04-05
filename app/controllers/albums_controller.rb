class AlbumsController < ApplicationController
  def create
    @album = Album.new(params[:album])
    
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
    @album = Album.new
    @album.band_id = params[:band_id]
  end
  
  def show
    @album = Album.find(params[:id])
  end
end
