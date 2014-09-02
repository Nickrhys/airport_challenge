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



  context 'taking off and landing' do

    before(:each) do
      allow(airport).to receive(:weather_stormy?).and_return(false)
    end
    
    it 'a plane can land' do
     expect(airport.plane_count).to eq (0)    
     airport.plane_land(plane)
     expect(airport.plane_count).to eq (1)
    end

    it 'the plane is not flying after landing' do
    allow(plane).to receive(:land).and_return(flying = false)
    airport.plane_land(plane)
    expect(airport.plane_count).to eq (1)
    end
    
    it 'a plane can take off' do
      airport.plane_fly(plane)
      expect(airport.plane_count).to eq (0)
    end

    it 'the plane is flying after taking off' do
    allow(plane).to receive(:take_off).and_return(flying = true)
    airport.plane_land(plane)
    airport.plane_fly(plane)
    expect(airport.plane_count).to eq (0)
    end

  end
  
  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
      allow(airport).to receive(:weather_stormy?).and_return(false)
      (airport.capacity).times {airport.plane_land(plane)}
  	  expect{ airport.plane_land(plane) }.to raise_error(RuntimeError)
    end
    
    context 'weather conditions' do

      before(:each) do
        allow(airport).to receive(:weather_stormy?).and_return(true)
      end

      it 'a plane cannot take off when there is a storm brewing' do
        airport.plane_land(plane)
        expect(airport.plane_fly(plane)).to eq "Weather conditions do not permit take off"

      end
      
      it 'a plane cannot land in the middle of a storm' do
        expect(airport.plane_land(plane)).to eq "Cannot land due to severe weather conditions"  
      end
    end
  end
end