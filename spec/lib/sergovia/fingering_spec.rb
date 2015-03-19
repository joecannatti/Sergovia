require 'spec_helper'
module Sergovia
  describe Fingering do

    describe "instantiation" do

      it "takes notes and a playbability score" do
        lambda { Fingering.new(notes: [], playability: 0.5) }.should_not raise_error
      end
    end
  end
end
