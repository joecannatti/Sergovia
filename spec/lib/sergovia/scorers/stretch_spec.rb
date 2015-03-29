require 'spec_helper'

module Sergovia
  describe Scorers::Stretch do

    it "returns 1.00 for anything with less than a 5 fret span between fretted notes" do
      fingering = Sergovia::Chord.new("e2,b2,e3,g#3,b3,e4").fingerings.first
      described_class.new(fingering).score.should eq 1.00
    end

    it "returns 0.00 for a chord with a seven fret span" do
      fingering = Sergovia::Fingering.new(notes: [Note.new(fret: 1, string: 6, pitch: :f2), Note.new(fret: 8, string: 5, pitch: :f3)])
      described_class.new(fingering).score.should eq 0.00
    end
      
  end
end

