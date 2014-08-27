class Airport

	DEFAULT_CAPACITY = 10

	def initialize
		@planes = []

	end

	def capacity
		@capacity = DEFAULT_CAPACITY
	end

	def plane_land(plane)
		raise "Airport full" if full?
		return "Cannot land due to severe weather conditions" if weather == :stormy
		@planes << plane
	end

	def plane_count
		@planes.count 
	end

	def plane_fly
		return "Weather conditions do not permit take off" if weather == :stormy
		@planes.pop
	end

	def full?
		plane_count == @capacity
	end




end