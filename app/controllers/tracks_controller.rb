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
    @track = Track.new(:album_id => params[:album_id])
  end

  def show
    @track = Track.find(params[:id])
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(params[:track])

    redirect_to track_url(@track)
  end
end
