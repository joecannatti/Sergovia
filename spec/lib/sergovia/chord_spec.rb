require 'spec_helper'

describe Chord do

  describe "fingerings" do
    context "an open guitar" do
      it "returns the only possible fingering" do
        Chord.new('e2,a2,d3,g3,b3,e4').fingerings.count.should eq 1
      end
    end
  end
end
