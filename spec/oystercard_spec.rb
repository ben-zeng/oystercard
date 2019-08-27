require 'oystercard'
describe Oystercard do

  describe "#initialize" do
    it "a new card will have a balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#top_up" do
    it "respond to an argument" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "balance increases by the amount topped up" do
      balance_before = subject.balance
      subject.top_up(10)
      expect((subject.balance) - balance_before).to eq(10)
    end

  end


end
