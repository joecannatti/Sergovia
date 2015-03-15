class Note
  attr_reader :fret, :string, :pitch

  def initialize(fret:, string:, pitch:)
    @fret = fret
    @string = string
    @pitch = pitch
  end

  def ==(other)
    self.fret == other.fret && self.string == other.string && self.pitch == other.pitch
  end
end
