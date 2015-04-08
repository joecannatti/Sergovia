module Sergovia
  class Fingering
    attr_reader :notes, :playability

    def initialize(notes:, playability: nil)
      @notes = notes
      @playability = playability
    end

    def to_tab
      (1..6).map do |i|
        @notes.select { |note| note.string == i }.first || Note.new(fret: ' x', string: i, pitch: nil)
      end.sort_by(&:string).map do |note| 
        if note.fret == " x"
          note.fret
        else
          "%2d" % note.fret
        end
      end
    end
  end
end
