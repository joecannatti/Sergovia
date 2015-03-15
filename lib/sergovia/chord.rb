class Chord
  attr_accessor :pitches

  def initialize(pitch_string)
    @pitch_string = pitch_string
  end

  def fingerings
    Transcriber.new.voicings(@pitch_string).map { |v| Fingering.new(voicing: v) }
  end
end
