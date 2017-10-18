class SearchController < ApplicationController
  def index
    location = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    reply = @conn.get("nearest.json?location=#{location}#{api_key}")
    response = JSON.parse(reply.body, symbolize_names: true)[:fuel_stations]

    @stations = response.map do |station|
      Station.new(station)
    end
  end

  private

    def api_key
      "&api_key=#{ENV["ALT_FUEL_API"]}"
    end

end
