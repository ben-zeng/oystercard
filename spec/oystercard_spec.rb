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

    it "raises error when the balance is higher then the max limit" do
      expect { subject.top_up(110) }.to raise_error Oystercard::ERROR_MAX_CAPACITY
    end
    describe "#deduct" do
      it "balance decreases by the amount specified" do
        balance_before = subject.balance
        subject.deduct(10)
        expect((subject.balance) - balance_before).to eq(-10)
      end
    end

    describe "#in_journey?" do
      it "returns true if in a journey" do
        expect(subject.in_journey?).to eq(subject.active)
      end
    end

    describe "#touch_in" do
      it "if not in an active journey, set @active true" do
        subject.touch_in
        expect(subject.in_journey?).to eq(true)
      end

    end

    describe "#touch_out" do

      it "if in an active journey, set @active false" do
        subject.touch_out
        expect(subject.in_journey?).to eq(false)
      end
    end

  end
end
