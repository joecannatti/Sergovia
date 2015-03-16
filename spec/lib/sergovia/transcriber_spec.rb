require 'spec_helper'
module Sergovia
  describe Transcriber do

    describe "instantiation" do

      it "optionally takes tunings and fret count" do
        v = Transcriber.new(tuning: [:e4, :a4, :d3, :g3, :b3, :d2], frets: 19)
        v.tuning.should eq [:e4, :a4, :d3, :g3, :b3, :d2]
        v.frets.should eq 19
      end

      it "setups fretboard" do
        Transcriber.new.fretboard.count.should eq 6
        Transcriber.new.fretboard.first[2].should eq :'f#4'
        Transcriber.new.fretboard.first[7].should eq :'b4'
        Transcriber.new.fretboard.first[8].should eq :'c5'
      end

    end

    describe "locations_for" do

      it "returns the only e2" do
        locations = Transcriber.new.locations_for(:e2)
        locations.count.should eq 1
        locations.first.string.should eq 6
        locations.first.fret.should eq 0
      end
      it "returns both a2s" do
        locations = Transcriber.new.locations_for(:a2)
        locations.count.should eq 2
        locations.first.string.should eq 5
        locations.first.fret.should eq 0
        locations[1].string.should eq 6
        locations[1].fret.should eq 5
      end
      it "returns all e4s" do
        locations = Transcriber.new.locations_for(:e4)
        locations.count.should eq 6
      end

      it "works with sharps" do
        locations = Transcriber.new.locations_for(:'f#2')
        locations.count.should eq 1
        locations.first.string.should eq 6
        locations.first.fret.should eq 2
      end

      it "works with flats" do
        locations = Transcriber.new.locations_for(:'gb2')
        locations.count.should eq 1
        locations.first.string.should eq 6
        locations.first.fret.should eq 2
      end
    end

    describe ".increment" do
      it "moves e to f" do
        Transcriber.new.increment(:e4).should eq :f4
      end
      it "moves b to c" do
        Transcriber.new.increment(:b3).should eq :c4
      end
      it "moves c to c#" do
        Transcriber.new.increment(:c3).should eq :'c#3'
      end
      it "moves bb to b" do
        Transcriber.new.increment(:bb3).should eq :'b3'
      end
      it "moves a# to b" do
        Transcriber.new.increment(:'a#3').should eq :'b3'
      end
      it "moves a to a#" do
        Transcriber.new.increment(:'a3').should eq :'a#3'
      end
    end

    describe "#theoretical_fingerings" do
      it "low a power chord has 6 possibilities" do
        Transcriber.new.theoretical_fingerings("a2,e3").count.should eq 6
      end
    end

    describe "#voicings" do

      it "removes voicings with 2 notes on the same string" do
        Transcriber.new.fingerings("a2,e3").count.should eq 4
      end

    end

  end
end
