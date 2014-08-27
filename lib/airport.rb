class Airport

	# DEFAULT_CAPACITY = 10

	def initialize
		@planes = []
		@capacity = 5

	end

	def plane_land(plane)
		raise "Airport full" if full?
		@planes << plane
	end

	def plane_count
		@planes.count 
	end

	def plane_fly
		@planes.pop
	end

	def full?
		plane_count == @capacity
	end




end