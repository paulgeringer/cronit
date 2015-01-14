require 'spec_helper'

describe Parser do
  let(:anything) { }

  it "has a crontab" do
    parser = Parser.new :anything
    parser.crontab
  end

  describe "#split_crontab" do
    it "converts a crontab to an array" do
      parser = Parser.new "* * * * *"
      expect(parser.arrayify_crontab).to be_kind_of(Array)
    end
  end

  describe "#validate_crontab" do
    it "raises an error if the crontab has less than 5 elements" do
      parser = Parser.new "* * * *"
      expect{parser.validate_crontab}.to raise_error(InvalidCrontab)
    end
  end

end
