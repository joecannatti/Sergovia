require 'spec_helper'
module Sergovia
  describe Chord do

    describe "optional args" do

      it "passes on an altered tuning" do
        fingering = Chord.new('e2,b2', tuning: [:d2, :a2, :d3, :g3, :b3, :e4]).fingerings.first
        fingering.notes.first.string.should eq 6
        fingering.notes.first.fret.should eq 2
        fingering.notes[1].string.should eq 5
        fingering.notes[1].fret.should eq 2
      end

      it "passes on the number of frets" do
        Chord.new('e6', frets: 24).fingerings.count.should eq 1
        Chord.new('e6', frets: 12).fingerings.count.should eq 0
      end
    end

    describe "fingerings" do

      context "an open guitar" do
        it "returns the only possible fingering" do
          Chord.new('e2,a2,d3,g3,b3,e4').fingerings.count.should eq 1
        end
      end

      context "an open e chord" do
        it "returns the only possible fingering" do
          Chord.new('e2,b2,e3,g#3,b3,e4').fingerings.count.should eq 1
        end
        it "works with ab instead of g#" do
          Chord.new('e2,b2,e3,ab3,b3,e4').fingerings.count.should eq 1
        end
      end

    end
  end
end
