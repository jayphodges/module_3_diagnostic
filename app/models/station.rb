class Station

  attr_reader :name,
              :address,
              :fuel_types,
              :distance,
              :access_time

  def initialize(response = {})
    @response = response
    @name = response[:station_name]
    @address = complete_address(response)
    @fuel_types = response[:fuel_type_code]
    @distance = distance_calc
    @access_times = response[:access_days_time]
  end


  private

    def complete_address(response)
      "#{response[:stree_address]}, #{response[:city]}, #{response[:state]} #{response[:zip]}"
    end

    def distance_calc
      5
    end
  # Name, Address, Fuel Types, Distance, and Access Times
end
