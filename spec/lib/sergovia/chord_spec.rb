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

      subject { Chord.new([:e4, :a4, :d3, :g3, :b3, :e2]).voicings }

      describe "the only possible voicing for the notes of the open guitar" do

        subject { Chord.new([:e4, :a4, :d3, :g3, :b3, :e2]).voicings.first.notes }

        it "contains the pitches passed in to the object" do
          expect(subject[0].pitch).to eq :e4
          expect(subject[1].pitch).to eq :a4
          expect(subject[2].pitch).to eq :d3
          expect(subject[3].pitch).to eq :g3
          expect(subject[4].pitch).to eq :b3
          expect(subject[5].pitch).to eq :e2
        end

        it "all of the pitches are played open" do
          expect(subject[0].fret).to eq 0
          expect(subject[1].fret).to eq 0
          expect(subject[2].fret).to eq 0
          expect(subject[3].fret).to eq 0 
          expect(subject[4].fret).to eq 0
          expect(subject[5].fret).to eq 0
        end

        it "all 6 strings are played" do
          expect(subject[0].string).to eq 6
          expect(subject[1].string).to eq 5
          expect(subject[2].string).to eq 4
          expect(subject[3].string).to eq 3 
          expect(subject[4].string).to eq 2
          expect(subject[5].string).to eq 1
        end

      end

    end

  end
end
