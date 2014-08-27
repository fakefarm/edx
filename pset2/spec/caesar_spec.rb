require "caesar"
require "spec_helper"

describe Caesar do

  describe "#encrypt" do
    it "encrypts a as b using 1 as key" do
      caesar = Caesar.new("a")
      expect(caesar.encrypt(1)).to eq "b"
    end

    it "encrypts 'barfoo' as 'yxocll' using 23 as key" do
      caesar = Caesar.new("barfoo")
      expect(caesar.encrypt(23)).to eq "yxocll"
    end

    it "encrypts BARFOO as EDUIRR using 3 as key" do
      caesar = Caesar.new("BARFOO")
      expect(caesar.encrypt(3)).to eq "EDUIRR"
    end

    it "encrypts BaRFoo as FeVJss using 4 as key" do
      caesar = Caesar.new("BaRFoo")
      expect(caesar.encrypt(4)).to eq "FeVJss"
    end

    it "encrypts barfoo as onesbb using 65 as key" do
      caesar = Caesar.new("barfoo")
      expect(caesar.encrypt(65)).to eq "onesbb"
    end

    it "encrypts 'world, say hello! as 'iadxp, emk tqxxa!' using 12 as key" do
      caesar = Caesar.new("world, say hello!")
      expect(caesar.encrypt(12)).to eq "iadxp, emk tqxxa!"
    end
  end
end