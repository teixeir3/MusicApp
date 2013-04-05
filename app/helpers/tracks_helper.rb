module TracksHelper
  def track_link(track)
    link_to track.name, track_url(track)
  end
end
