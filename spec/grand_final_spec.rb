require 'airport'
require 'plane'

# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
# This will require stubbing to stop the random return of the weather.

describe "The grand finale" do

it 'all planes can land and all planes can take off' do
	luton       = Airport.new
	six_planes  = []
  last_plane  = Plane.new
  6.times { six_planes << Plane.new }
  allow(luton).to receive(:weather_stormy?).and_return(false)

  six_planes.each { |plane| luton.plane_land(plane) }
  expect(luton.plane_count).to eq 6

  luton.release_all_landed_planes

  expect(luton.plane_count).to eq 0
  end
end

