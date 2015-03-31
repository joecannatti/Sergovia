module Sergovia
  module Scorers
    class Stretch

      attr_reader :fingering

      def initialize(fingering)
        @fingering = fingering
      end

      def score
        #handle nils
        frets = fingering.notes.map(&:fret).reject { |n| n == 0 }.sort
        if frets.count > 1
          span = (frets.max - frets.min)
          if span > 6
            return 0.00
          elsif span == 6
            return 0.10
          elsif span == 5
            return 0.25
          elsif span == 4
            return 0.75
          else
            return 1.00
          end
        else
          return 1.00
        end
      end


    end
  end
end
