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
      expect{subject.top_up(10)}.to change{subject.balance}.by(10)
    end

    it "raises error when the balance is higher then the max limit" do
      expect { subject.top_up(110) }.to raise_error("Error! top up beyond limit")
    end
    
    describe "#in_journey?" do
      it "returns true if in a journey" do
        expect(subject.in_journey?).to eq(subject.active)
      end
    end

    describe "#touch_in" do
      it "if not in an active journey, set @active true" do
        subject.top_up(1)
        subject.touch_in
        expect(subject.in_journey?).to eq(true)
      end

      it "raises error if card balance is less or equal than minimum required balance" do
        expect{subject.touch_in}.to raise_error("Insufficient funds")
      end

    end

    describe "#touch_out" do

      it "if in an active journey, set @active false" do
        subject.touch_out
        expect(subject.in_journey?).to eq(false)
      end

      it "deducts the minimum fare when a journey is completed on touch-out" do
        subject.top_up(1)
        subject.touch_in
        expect{subject.touch_out}.to change{subject.balance}.by(-1)
      end
    end

  end
end
