module BandsHelper
  def band_link(band)
    link_to band.name, band_url(band)
  end
end
