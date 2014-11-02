require 'spec_helper'

describe Chord do

  describe 'instantiation' do

    it 'takes an array of symbol representing pitches (e.g. :c5, :e5)' do
      expect { 
        Chord.new([:c5, :e5]) 
      }.not_to raise_error
    end

    it 'stores the given pitches in a property' do
      expect( Chord.new([:c5, :e5]).pitches ).to eq [:c5, :e5]
    end

  end

  describe 'voicings' do

    describe "returns an array possible (but not necessarily playable) voicings for the chord's pitches on the guitar" do

      describe "for the only possible voicing for the notes of the open guitar" do

        subject { Chord.new([:e4, :a4, :d3, :g3, :b3, :e2]).voicings.first.notes }

        it "contains the pitches passed in to the object" do
          expect(subject.map(&:pitch)).to eq [:e4 ,:a4 ,:d3 ,:g3 ,:b3 ,:e2]
        end

        it "all of the pitches are played open" do
          expect(subject.map(&:fret)).to eq [0,0,0,0,0,0]
        end

        it "all 6 strings are played" do
          expect(subject.map(&:string)).to eq [6,5,4,3,2,1]
        end

      end

    end

  end
end
