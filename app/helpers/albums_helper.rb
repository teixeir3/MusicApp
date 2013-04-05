module AlbumsHelper
  def album_link(album)
    link_to album.name, album_url(album)
  end
end
