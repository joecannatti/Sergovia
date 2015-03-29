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
          if (frets.max - frets.min) > 4
            return 0.00
          else
            return 1.00
          end
        else
          return nil
        end
      end


    end
  end
end
