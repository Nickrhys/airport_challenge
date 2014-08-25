class Plane

	def initialize
		in_air!
	end

	def flying?
		@flying
	end

	def in_air!
		@flying = true	
	end

	def take_off!
		in_air!
	end

	def land!
		@flying = false
	end

end

