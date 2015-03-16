module Sergovia
  class Fingering
    attr_reader :notes

    def initialize(notes:)
      @notes = notes
    end
  end
end
