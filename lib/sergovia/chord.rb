class Chord
  attr_accessor :pitches

  def initialize(pitches)
    @pitches = pitches
  end

  def voicings
    [OpenStruct.new(notes: pitches.each_with_index.map do |pitch, index|
      OpenStruct.new({
        pitch: pitch,
        fret: 0,
        string: (index - 6).abs
      })
    end)]
  end
end
