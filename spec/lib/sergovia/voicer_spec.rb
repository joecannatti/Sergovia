require 'spec_helper'

describe Voicer do

  describe "instantiation" do

    it "optionally takes tunings and fret count" do
      v = Voicer.new(tuning: [:d4, :a4, :d3, :g3, :b3, :e2], frets: 19)
      v.tuning.should eq [:d4, :a4, :d3, :g3, :b3, :e2]
      v.frets.should eq 19
    end

    it "setups fretboard" do
      Voicer.new.fretboard.count.should eq 6
      Voicer.new.fretboard.first[2].should eq :'f#4'
      Voicer.new.fretboard.first[7].should eq :'b4'
      Voicer.new.fretboard.first[8].should eq :'c5'
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

