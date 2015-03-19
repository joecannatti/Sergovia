module Sergovia
  class Fingering
    attr_reader :notes, :playability

    def initialize(notes:, playability: nil)
      @notes = notes
      @playability = playability
    end
  end
end
