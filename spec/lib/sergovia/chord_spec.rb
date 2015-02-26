require 'spec_helper'

describe Chord do

  describe "fingerings" do
    context "an open guitar" do
      it "returns the only possible fingering" do
        Chord.new('e2,a2,d3,g3,b3,e4').fingerings.count.should eq 1
      end
    end
    context "an open e chord" do
      it "returns the only possible fingering" do
        Chord.new('e2,b2,e3,g#3,b3,e4').fingerings.count.should eq 1
      end
      it "works with ab instead of g#" do
        Chord.new('e2,b2,e3,ab3,b3,e4').fingerings.count.should eq 1
      end
    end
  end
end
