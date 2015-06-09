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

    def to_tab
      fingerings.select{ |f| f.playability > 0.0 }.map(&:to_tab).transpose.map { |string| string.join("--") }.join("\n")
    end
  end
end
