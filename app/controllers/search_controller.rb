class SearchController < ApplicationController
  def index
    location = params[:q]
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |faraday|
      faraday.headers["api_key"] = ENV["ALT_FUEL_API"]
      faraday.adapter Faraday.default_adapter
    end
    binding.pry
    reply = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{location}")

  end

# https://swrdfSr1SFSvXrlO3O0RpaHBE17pZBpX4HFtDQCK@api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?location=80203
end
