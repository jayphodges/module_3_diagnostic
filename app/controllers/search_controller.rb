class SearchController < ApplicationController
  def index
    location = params[:q]
    @conn = Faraday.new(url: "https://api.data.gov/nrel/alt-fuel-stations/") do |faraday|
      faraday.headers["api_key"] = ENV["ALT_FUEL_API"]
      faraday.adapter Faraday.default_adapter
    end
    binding.pry
    reply = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{location}")

  end


end
