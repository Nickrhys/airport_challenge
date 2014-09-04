module Weather #Include a weather condition using a module.

	def weather_stormy?
		rand(1..4) == 4
	end
end	
 	
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
