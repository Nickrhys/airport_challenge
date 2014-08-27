require 'airport'
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let (:airport) 		{ Airport.new 					}
  let (:plane)			{ double :plane 				}
  let (:plane_land)  	{ double :plane, flying?: false }
  let (:plane_fly) 		{ double :plane, flying?: true  }


  context 'taking off and landing' do
    
    it 'a plane can land' do
     expect(airport.plane_count).to eq 0    
     airport.plane_land(plane)
     expect(airport.plane_count).to eq 1
    end
    
    it 'a plane can take off' do
      airport.plane_fly
      expect(airport.plane_count).to eq 0
    end
  end
  
  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      5.times {airport.plane_land(plane)}
      # expect(airport).to be_full   
  	  expect{ airport.plane_land(plane) }.to raise_error(RuntimeError)
    end
    
  end
end