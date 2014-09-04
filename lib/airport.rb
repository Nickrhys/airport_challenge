require_relative 'weather'
require_relative 'plane'

class Airport

	include Weather

	DEFAULT_CAPACITY = 6

	def initialize
		@planes   = []
		@capacity = DEFAULT_CAPACITY
	end

	def capacity
		@capacity 
	end

	def plane_land(plane)
		raise "Airport full" if full?
		return "Cannot land due to severe weather conditions" if weather_stormy?
		plane.land!
		@planes << plane
	end

	def plane_count
		@planes.count 
	end

	def plane_fly(plane)
		return "Weather conditions do not permit take off" if weather_stormy?
		plane.take_off! 
		@planes.delete(plane)

	end

	def full?
		plane_count == @capacity
	end

	def release_all_landed_planes
		until @planes.empty? do
			@planes.each { |landed_plane| plane_fly(landed_plane) }
		end		
	end
end