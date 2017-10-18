class Station < ActiveRecord::Base

  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_time

  def initialize(response = {})
    @name = response[:station_name]
    @address = complete_address
    @fuel_types = response[:fuel_type_code]
  end



  # Name, Address, Fuel Types, Distance, and Access Times
end
