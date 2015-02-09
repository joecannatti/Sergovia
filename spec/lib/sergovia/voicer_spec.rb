require 'spec_helper'

describe Voicer do

  describe "instantiation" do

    it "optionally takes tunings and fret count" do
      v = Voicer.new(tuning: [:e4, :a4, :d3, :g3, :b3, :d2], frets: 19)
      v.tuning.should eq [:e4, :a4, :d3, :g3, :b3, :d2]
      v.frets.should eq 19
    end

    it "setups fretboard" do
      Voicer.new.fretboard.count.should eq 6
      Voicer.new.fretboard.first[2].should eq :'f#4'
      Voicer.new.fretboard.first[7].should eq :'b4'
      Voicer.new.fretboard.first[8].should eq :'c5'
    end

  end

  describe "locations_for" do

    it "returns the only e2" do
      locations = Voicer.new.locations_for(:e2)
      locations.count.should eq 1
      locations.first[:string].should eq 6
      locations.first[:fret].should eq 0
    end
    it "returns both a2s" do
      locations = Voicer.new.locations_for(:a2)
      locations.count.should eq 2
      locations.first[:string].should eq 5
      locations.first[:fret].should eq 0
      locations[1][:string].should eq 6
      locations[1][:fret].should eq 5
    end
    it "returns all e4s" do
      locations = Voicer.new.locations_for(:e4)
      locations.count.should eq 6
    end
  end

  describe ".increment" do
    it "moves e to f" do
      Voicer.new.increment(:e4).should eq :f4
    end
    it "moves b to c" do
      Voicer.new.increment(:b3).should eq :c4
    end
    it "moves c to c#" do
      Voicer.new.increment(:c3).should eq :'c#3'
    end
    it "moves bb to b" do
      Voicer.new.increment(:bb3).should eq :'b3'
    end
    it "moves a# to b" do
      Voicer.new.increment(:'a#3').should eq :'b3'
    end
    it "moves a to a#" do
      Voicer.new.increment(:'a3').should eq :'a#3'
    end
  end

end

