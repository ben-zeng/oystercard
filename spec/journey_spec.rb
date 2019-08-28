require 'journey'

describe Journey do
  let(:journey_a) {Journey.new("Aldgate")}
  let(:journey_b) {Journey.new}
  let(:exit_station) {double :exit_station}

  it "initializes with an entry station local var" do
    expect(journey_a.entry_station).to eq("Aldgate")
  end

  it "creates an instance of exit_station when the journey is ended" do
    journey_a.end_journey(exit_station)
    expect(journey_a.exit_station).to eq(exit_station)
  end

  it "charges minimum fare if journey is complete" do
    journey_a.end_journey(exit_station)
    expect(journey_a.fare).to eq(1)
  end

  it "charges penalty fare if journey is incomplete" do
    expect(journey_b.fare).to eq(6)
  end

  it "charges penalty fare if journey is incomplete" do
    journey_b.end_journey(exit_station)
    expect(journey_b.fare).to eq(6)
  end

end