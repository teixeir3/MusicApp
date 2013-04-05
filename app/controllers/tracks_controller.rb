class TracksController < ApplicationController
  def create
    @track = Track.new(params[:track])
    
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end
  
  def index
    @tracks = Track.all
  end
  
  def new
    @track = Track.new
    @track.album_id = params[:album_id]
  end
  
  def show
    @track = Track.find(params[:id])
  end
end
