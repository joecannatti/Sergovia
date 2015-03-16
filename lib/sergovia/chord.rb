module Sergovia
  class Chord
    attr_accessor :pitches, :tuning, :frets

    def initialize(pitch_string, tuning: STANDARD_TUNING, frets: 24)
      @pitch_string = pitch_string
      @tuning = tuning
      @frets = frets
    end

    def fingerings
      Transcriber.new(tuning: tuning, frets: frets).fingerings(@pitch_string)
    end
  end
end
