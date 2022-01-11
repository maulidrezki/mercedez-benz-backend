require 'json'
require 'open-uri'

def mapbox_apiurl(lat, lng)
  "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{lng},#{lat}&access_token=#{ENV['MAPBOX_API_KEY']}"
end

class MuseumsController < ApplicationController
  def index
    @lat = params[:lat]
    @lng = params[:lng]
    unless (@lat.nil? && @lng.nil?) || !(@lat.to_i.between?(-90, 90) && @lng.to_i.between?(-90, 90))
      query = JSON.parse(URI.open(mapbox_apiurl(@lat, @lng)).read)['features'].map { |f| [f['context'][0]['text'], f['text']] }
      @museums = query.inject(Hash.new { |h, k| h[k]=[] }){ |h, (k, v)| h[k] << v; h }
    end
  end
end
