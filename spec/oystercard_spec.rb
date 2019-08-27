require 'oystercard'
describe Oystercard do

  describe "#initialize" do
    it "a new card will have a balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up " do
    it "respond to an argument" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
  end


end
