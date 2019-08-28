require 'station'
     describe Station do

     let (:station_a) {Station.new(1, "Algate") }

     describe "initialize" do
       it "expect zone passed in to equal instance variable" do
         expect(station_a.zone).to eq(1)
       end

       it "expect name passed in to equal instance variable" do
         expect(station_a.name).to eq("Algate")
        end
     end
   end