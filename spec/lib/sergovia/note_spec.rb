require 'spec_helper'
module Sergovia
  describe Note do

    subject { described_class.new(fret: 0, string: 1, pitch: :e4) }

    it "accepts and stores fret, string, and pitch" do
      subject.fret.should eq 0
      subject.string.should eq 1
      subject.pitch.should eq :e4
    end

    describe "==" do

      it "returns true if all the properties are equal" do
        (described_class.new(fret: 0, string: 1, pitch: :e4) == described_class.new(fret: 0, string: 1, pitch: :e4)).should eq true
      end

      it "returns false if the properties are not equal" do
        (described_class.new(fret: 0, string: 1, pitch: :e4) == described_class.new(fret: 1, string: 1, pitch: :f4)).should eq false
      end
    end
  end
end
