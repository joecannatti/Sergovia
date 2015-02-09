class Chord
  attr_accessor :pitches

  def initialize(pitch_string)
    @pitch_string = pitch_string
  end

  def fingerings
    Voicer.new.voicings(@pitch_string)
  end
end
